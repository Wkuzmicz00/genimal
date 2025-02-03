from PySide6.QtCore import QObject, Signal, Slot, QThread
from typing import List, Dict, Union, TypedDict
from PIL import Image
from personality_classifier import PersonalityClassifier
from animal_classifier import AnimalClassifier
import os

class ResultDict(TypedDict):
    name: str
    image_path: str
    percent: float

class ModelWorker(QThread):
    resultReady = Signal(list)
    finished = Signal()
    errorOccurred = Signal(str)

    def __init__(self, task: str, image_path: str = "", text: str = ""):
        super().__init__()
        self.task = task
        self.image_path = image_path
        self.text = text
        self.animal_classifier = AnimalClassifier()
        self.personality_classifier = PersonalityClassifier()
        self.finished.connect(self.cleanup)

    def run(self):
        """
        Runs the appropriate task based on the initialized parameters.
        """
        try:
            if self.task == 'image':
                json_list = self._calculate_probability_from_image(self.image_path)
            elif self.task == 'text':
                json_list = self._calculate_probability_from_text(self.text)
            else:
                json_list = []

            print(json_list)

            self.resultReady.emit(json_list)
        except Exception as e:
            self.errorOccurred.emit(str(e))
        finally:
            self.finished.emit()

    def _calculate_probability_from_image(self, image_path: str) -> List[ResultDict]:
        """
        Perform image classification asynchronously and return the results as JSON.
        """
        image = Image.open(image_path[8:])
        result = self.animal_classifier.predict(image)
        json_list = self._parse_to_json(result)
        return json_list

    def _calculate_probability_from_text(self, text: str) -> List[ResultDict]:
        """
        Perform text classification asynchronously and return the results as JSON.
        """
        json_list = self.personality_classifier.check_personality(text)
        return json_list

    def _parse_to_json(self, data: str) -> List[ResultDict]:
        """
        Convert the result from the prediction to a JSON-like format.
        """
        json_list = []
        for name, percent in data:
            image_name = name.lower() + ".png"
            image_path = os.path.abspath(f"./../ui/assets/animal_images/{image_name}")
            
            if not os.path.exists(image_path):
                print(f"Warning: Image not found for {name}")
                image_path = ""

            image_path = r"file://" + image_path
            json_list.append({
                "name": name,
                "image_path": image_path,
                "percent": percent
            })
        return json_list

    def cleanup(self):
        """
        Stops the thread and waits for it to finish execution.
        This method should be called when the worker is no longer needed.
        """
        self.quit()
        self.wait()