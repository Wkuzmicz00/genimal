import sys
import os

from PySide6.QtCore import QUrl, QCoreApplication
from PySide6.QtQml import QQmlApplicationEngine


if __name__ == '__main__':
    app = QCoreApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # Add the current directory to the import paths and load the main module.
    # Dodajemy ścieżki importu dla folderów, które zawierają Twoje moduły
    
    MODULE_DIR = os.path.dirname(__file__)
    QML_IMPORT_DIR = os.path.join(MODULE_DIR, "ui")
    APP_PATH = os.path.join(MODULE_DIR, "ui", "Main.qml")
# Dodajemy te ścieżki do silnika QML
    engine.addImportPath(QML_IMPORT_DIR)
    print(engine.importPathList())
    
    # Ścieżka do folderu, w którym chcesz sprawdzić obecność pliku qmldir

    engine.load(QUrl.fromLocalFile(APP_PATH))

    if not engine.rootObjects():
        sys.exit(-1)

    ex = app.exec()
    del engine
    sys.exit(ex)
