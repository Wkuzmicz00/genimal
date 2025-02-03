from PySide6.QtCore import QObject, Signal, Slot

from model import MainModel

from generate_html import generate_raport

import json

class Controller(QObject):
    resultReady = Signal(str)

    def __init__(self):
        super().__init__()
        self.json_list = []
        self.model = MainModel()

    @Slot(str)
    def process_text(self, text: str):
        self.json_list = self.model.caclculate_probability_from_text(text)

        self.resultReady.emit(json.dumps(self.json_list))

    @Slot(str)
    def process_image(self, image_path: str):
<<<<<<< Updated upstream
        json_list = self.model.caclculate_probability_from_image(image_path[8:])
=======
        self.json_list = self.model.caclculate_probability_from_image(image_path[7:])

        self.resultReady.emit(json.dumps(self.json_list))

    @Slot()
    def create_raport(self):
        generate_raport(self.json_list)
>>>>>>> Stashed changes




