from PySide6.QtCore import QObject, Signal, Slot, QThread
import json
from model import ModelWorker, ResultDict
from typing import List, Dict, Union

class Controller(QObject):
    """
    Controller class to manage interactions between the UI and the background worker.
    """

    resultReady = Signal(str)

    def __init__(self):
        """
        Initialize the Controller.
        """
        super().__init__()

    @Slot(str)
    def process_text(self, text: str):
        """
        Start the background worker to process text.

        Args:
            text (str): The input text to classify.
        """
        worker = ModelWorker(task="text", text=text)
        worker.resultReady.connect(self.on_result_ready)
        worker.errorOccurred.connect(self.on_error_occurred)
        worker.finished.connect(lambda: self.on_worker_finished(worker))
        worker.run()

    @Slot(str)
    def process_image(self, image_path: str):
        """
        Start the background worker to process an image.

        Args:
            image_path (str): The path to the image to classify.
        """
        worker = ModelWorker(task="image", image_path=image_path)
        worker.resultReady.connect(self.on_result_ready)
        worker.errorOccurred.connect(self.on_error_occurred)
        worker.finished.connect(lambda: self.on_worker_finished(worker))
        print("XD")
        worker.run()

    @Slot(list)
    def on_result_ready(self, result: List):
        """
        Slot to handle the result of the processing (image or text).

        Args:
            result (List[ResultDict]): The result of the classification.
        """
        self.resultReady.emit(json.dumps(result))

    @Slot(str)
    def on_error_occurred(self, error_message: str):
        """
        Slot to handle errors from the worker.

        Args:
            error_message (str): The error message from the worker.
        """
        print(error_message)

    @Slot(QThread)
    def on_worker_finished(self, worker: QThread):
        """
        Slot to clean up the worker thread when it finishes.

        Args:
            worker (QThread): The worker thread that has finished.
        """
        worker.quit()
        worker.wait()