from PySide6.QtCore import QObject, Signal, Slot

class Controller(QObject):
    resultReady = Signal(str)

    @Slot(str)
    def process_image(self, file_path):
        result = 1#Przekazanie path do modelu

        self.resultReady.emit(result)