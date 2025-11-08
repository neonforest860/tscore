import sys
import os
from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle


def main():
    # Set Material Design as the style
    QQuickStyle.setStyle("Material")

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Load the QML file
    qml_path = os.path.join(os.path.dirname(__file__), 'qml', 'main.qml')
    qml_url = QUrl.fromLocalFile(os.path.abspath(qml_path))
    engine.load(qml_url)

    if not engine.rootObjects():
        print("Error: Failed to load QML")
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == '__main__':
    main()
