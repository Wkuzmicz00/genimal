from PySide6.QtCore import QObject, Signal, Slot

from model import MainModel

import json

class Controller(QObject):
    resultReady = Signal(str)

    def __init__(self):
        super().__init__()
        self.model = MainModel()

    @Slot(str)
    def process_text(self, text: str):
        json_list = self.model.caclculate_probability_from_text(text)

        self.resultReady.emit(json.dumps(json_list))

    @Slot(str)
    def process_image(self, image_path: str):
        json_list = self.model.caclculate_probability_from_image(image_path[8:])

        self.resultReady.emit(json.dumps(json_list))



