from typing import List, Dict, Union

from PIL import Image

from personality_classifier import PersonalityClassifier
from animal_classifier import AnimalClassifier

class MainModel():
    def __init__(self):
        self.animal_classifier = AnimalClassifier()
        self.personality_classifier = PersonalityClassifier()

    def caclculate_probability_from_image(self, image_path: str) -> List[Dict[str, Union[str, float]]]:
        image = Image.open(image_path)
        result = self.animal_classifier.predict(image)
        json_list = self._parse_to_json(result)

        return json_list

    def caclculate_probability_from_text(self, text: str) -> List[Dict[str, Union[str, float]]]:
        json_list = self.personality_classifier.check_personality(text)

        return json_list

    def _parse_to_json(self, data: str) -> List[Dict[str, Union[str, float]]]:
        json_list = []

        for name, percent in data:
            json_list.append({
                "name": name, 
                "image_path":f"./../assets/animal_images/{name.lower()}.png",
                "percent": percent
                })

        return json_list