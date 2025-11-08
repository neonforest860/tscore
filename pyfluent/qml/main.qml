import QtQuick 2.15
import QtQuick.Window 2.15
import FluentUI 1.0

FluApp {
    width: 640
    height: 480

    FluText {
        id: hello
        text: "Hello FluentUI from PySide6"
        anchors.centerIn: parent
        font.pixelSize: 20
    }
}
