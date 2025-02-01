import sys
import os
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QTimer, Qt
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuick import QQuickView

from controller import Controller

def load_main_window(MODULE_DIR: str, engine: QQmlApplicationEngine) -> None:
    """
    Loads the main window (Main.qml) into the application engine and makes it visible.

    Args:
        MODULE_DIR (str): The directory where the current module resides.
        engine (QQmlApplicationEngine): The QML application engine to load the Main.qml file.
    """
    MAIN_PATH = os.path.join(MODULE_DIR, "..", "ui", "Main.qml")

    engine.load(QUrl.fromLocalFile(MAIN_PATH))

    if not engine.rootObjects():
        print("Error: Main.qml could not be loaded!")
        sys.exit(-1)

    engine.rootObjects()[0].setVisible(True)


def load_splash_screen(MODULE_DIR: str, QML_IMPORT_DIR: str) -> QQuickView:
    """
    Loads the splash screen (SplashScreen.qml) and configures it as a frameless and transparent window.

    Args:
        MODULE_DIR (str): The directory where the current module resides.
        QML_IMPORT_DIR (str): The directory containing the import paths for QML files.

    Returns:
        QQuickView: The QQuickView instance displaying the splash screen.
    """
    SPLASH_PATH = os.path.join(MODULE_DIR, "..", "ui", "components", "SplashScreen.qml")
    splash_view = QQuickView()

    splash_view.setFlags(splash_view.flags() | Qt.FramelessWindowHint)
    splash_view.setColor(Qt.transparent)

    splash_view.engine().addImportPath(QML_IMPORT_DIR)
    splash_view.setSource(QUrl.fromLocalFile(SPLASH_PATH))

    splash_view.show()

    return splash_view

def main() -> None:
    """
    Initializes the application, loads the splash screen, and then loads the main window after the splash screen is dismissed.

    This function also creates the Controller object and exposes it to QML as a context property.
    """
    app = QGuiApplication(sys.argv)

    MODULE_DIR = os.path.dirname(__file__)
    QML_IMPORT_DIR = os.path.join(MODULE_DIR, "..", "ui")

    splash_view = load_splash_screen(MODULE_DIR, QML_IMPORT_DIR)

    engine = QQmlApplicationEngine()
    engine.addImportPath(QML_IMPORT_DIR)


    engine.rootObjects().append(None)

    splash_timer = QTimer()
    splash_timer.setSingleShot(True)
    splash_timer.timeout.connect(lambda: (load_main_window(MODULE_DIR, engine), splash_view.close()))
    splash_timer.start(4900)

    controller = Controller()
    engine.rootContext().setContextProperty("controller", controller)

    sys.exit(app.exec())

if __name__ == '__main__':
    main()
