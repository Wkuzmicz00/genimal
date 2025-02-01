import torch
from torchvision.models import resnet18, ResNet18_Weights
import torchvision
from PIL import Image

import pandas as pd

class AnimalClassifier():
    """
    A class to classify animal images using a pre-trained ResNet18 model.

    Attributes:
        classes (list): List of class names loaded from a CSV file.
        device (torch.device): Device to run the model on (CPU).
        model (torch.nn.Module): Pre-trained ResNet18 model with custom weights.
        class_names (dict): Dictionary mapping class indices to class names.
        transform (torchvision.transforms.Compose): Image transformations for model input.
        softmax (torch.nn.Softmax): Softmax function to convert model outputs to probabilities.
    """

    def __init__(self, classes_path: str = "./data/classes.csv", model_path: str = "./models/animal_cnn.pth"):
        """
        Initializes the AnimalClassifier class.

        Args:
            classes_path (str): Path to the CSV file containing class names. Defaults to "./data/classes.csv".
            model_path (str): Path to the pre-trained model weights. Defaults to "./models/animal_cnn.pth".

        Raises:
            RuntimeError: If loading classes or model weights fails.
        """

        try:
            self.classes = pd.read_csv(classes_path)["class"].tolist()
        except Exception as e:
            raise RuntimeError(f"Failed to load classes from {classes_path}: {str(e)}")

        self.device = torch.device("cpu")

        # Initialize model
        self.model = resnet18(weights=ResNet18_Weights.DEFAULT)

        # Load model weights
        try:
            self.model.load_state_dict(torch.load(model_path, map_location=self.device))
        except Exception as e:
            raise RuntimeError(f"Failed to load model from {model_path}: {str(e)}")

        self.model.to(self.device)
        self.model.eval()
        self.class_names = {i: self.classes[i] for i in range(len(self.classes))}

        # Basic image transformation for ResNet18 model
        self.transform = torchvision.transforms.Compose([
            torchvision.transforms.Resize((224, 224)),
            torchvision.transforms.ToTensor(),
            torchvision.transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
        ])
        self.softmax = torch.nn.Softmax(dim=1)

    def predict(self, image: Image.Image) -> list[tuple[str, str]]:
        """
        Predicts the top 5 animal classes and their probabilities for a given image.

        Args:
            image (Image.Image): A PIL image to classify.

        Returns:
            list[tuple[str, str]]: A list of tuples containing the top 5 predicted classes
                                   and their probabilities in percentage format.
                                   Example: [("lion", "95.5"), ("tiger", "3.2"), ...]
        """

        image = self.transform(image).unsqueeze(0)
        image = image.to(self.device)
        with torch.no_grad():
            outputs = self.model(image)
            outputs = self.softmax(outputs)
            predicted_5 = torch.topk(outputs, 5, dim=1)
            res = [(self.class_names[idx.item()], f"{prob.item()*100: .1f}") for prob, idx in zip(predicted_5.values[0], predicted_5.indices[0])]
            return res