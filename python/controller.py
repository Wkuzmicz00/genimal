from PySide6.QtCore import QObject, Signal, Slot

from personality_detection import personalty_detector

import json

class Controller(QObject):
    resultReady = Signal(str)

    @Slot(str)
    def process_text(self, text):
        detector = personalty_detector()
        result = detector.check_personality(text)
        print(json.dumps(result))

        self.resultReady.emit(json.dumps(result))