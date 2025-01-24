import sys
import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl
from PySide6.QtQml import QQmlApplicationEngine

from controller import Controller

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    controller = Controller()

    MODULE_DIR = os.path.dirname(__file__)
    QML_IMPORT_DIR = os.path.join(MODULE_DIR, "..", "ui")
    APP_PATH = os.path.join(MODULE_DIR, "..", "ui", "Main.qml")

    engine.addImportPath(QML_IMPORT_DIR)
    print(engine.importPathList())

    engine.load(QUrl.fromLocalFile(APP_PATH))

    controller = Controller()
    engine.rootContext().setContextProperty("controller", controller)

    if not engine.rootObjects():
        sys.exit(-1)

    ex = app.exec()
    del engine
    sys.exit(ex)
