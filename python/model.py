from typing import List, Dict, Union

from PIL import Image

from personality_classifier import PersonalityClassifier
from animal_classifier import AnimalClassifier

import generate_html as huj

import os

class MainModel():
    def __init__(self):
        self.animal_classifier = AnimalClassifier()
        self.personality_classifier = PersonalityClassifier()

    def caclculate_probability_from_image(self, image_path: str) -> List[Dict[str, Union[str, float]]]:
        image = Image.open(image_path)
        result = self.animal_classifier.predict(image)
        json_list = self._parse_to_json(result)
        huj.generate_raport(json_list)

        return json_list

    def caclculate_probability_from_text(self, text: str) -> List[Dict[str, Union[str, float]]]:
        json_list = self.personality_classifier.check_personality(text)
        huj.generate_raport(json_list)

        return json_list

    def _parse_to_json(self, data: str) -> List[Dict[str, Union[str, float]]]:
        json_list = []

        for name, percent in data:
            path = os.path.abspath(f"./../ui/assets/animal_images/{name.lower()}.png")
            print(path)
            json_list.append({
                "name": name, 
                "image_path": path,
                "percent": percent
                })

        return json_list