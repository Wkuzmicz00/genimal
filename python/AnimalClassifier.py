import torch
from torchvision.models import resnet18, ResNet18_Weights
import torchvision
from PIL import Image
import os
import pandas as pd

class AnimalClassifier():
    def __init__(self, classes_path="data/classes.csv", model_path="data/animal_cnn.pth"):
        #Standard user probably will use cpu, so it can be a little bit slower
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        #List of classes is too long to hardcode it, so it will be loaded from a file
        try:
            self.classes = pd.read_csv(classes_path)["class"].tolist()
        except Exception as e:
            raise RuntimeError(f"Failed to load classes from {classes_path}: {str(e)}")
        
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        
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
        #basic image transformation for ResNet18 model
        self.transform = torchvision.transforms.Compose([
            torchvision.transforms.Resize((224, 224)),
            torchvision.transforms.ToTensor(),
            torchvision.transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
        ])
        self.softmax = torch.nn.Softmax(dim=1)
    def predict(self, image):
        image = self.transform(image).unsqueeze(0)
        image = image.to(self.device)
        with torch.no_grad():
            outputs = self.model(image)
            outputs = self.softmax(outputs)
            predicted_5 = torch.topk(outputs, 5, dim=1)
            res = [(self.class_names[idx.item()], f"{prob.item()*100: .1f}") for prob, idx in zip(predicted_5.values[0], predicted_5.indices[0])]
            #Return top 5 classes and probabilities - [(class1, prob1), (class2, prob2), ...]
            return res
    def get_classes(self):
        #Return list of classes
        return self.classes


clasifier = AnimalClassifier()
classes = clasifier.get_classes()
print(classes)
#When using the predict method, pass a PIL image as an argument
#Example:
#image = Image.open("dog.jpg")
    