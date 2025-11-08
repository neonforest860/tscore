import sys
import os
from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

# Make the local cloned wrapper importable (if you're using the cloned repo)
wrapper_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'PySide6-FluentUI-QML'))
if os.path.isdir(wrapper_path) and wrapper_path not in sys.path:
    sys.path.insert(0, wrapper_path)

try:
    from FluentUI import FluentUI
except Exception as e:
    print("Failed to import FluentUI wrapper. Ensure PySide6-FluentUI-QML is on PYTHONPATH or installed.")
    raise


def main():
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Register FluentUI QML types into the engine
    FluentUI.registerTypes(engine)

    qml_path = os.path.join(os.path.dirname(__file__), 'qml', 'main.qml')
    qml_url = QUrl.fromLocalFile(os.path.abspath(qml_path))
    engine.load(qml_url)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())


if __name__ == '__main__':
    main()
