import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 1000
    height: 700
    visible: true
    title: "Material Design - PySide6 App"

    // Theme state properties
    property bool isDarkMode: false
    property string currentTheme: "Basil"

    // Theme configurations based on Material Design Studies
    property var themes: ({
        "Basil": {
            "primary": "#356859",      // Deep green
            "accent": "#37966F",       // Light green
            "lightBg": "#FFFFFF",
            "darkBg": "#1B3A32"
        },
        "Crane": {
            "primary": "#E30425",      // Red
            "accent": "#5D1049",       // Purple
            "lightBg": "#FFFFFF",
            "darkBg": "#2D0C24"
        },
        "Fortnightly": {
            "primary": "#000000",      // Black
            "accent": "#6B38FB",       // Purple
            "lightBg": "#FFFFFF",
            "darkBg": "#121212"
        },
        "Owl": {
            "primary": "#0336FF",      // Blue
            "accent": "#FFC107",       // Yellow
            "lightBg": "#FFFFFF",
            "darkBg": "#0B1F3E"
        },
        "Rally": {
            "primary": "#1EB980",      // Green
            "accent": "#FFD400",       // Yellow
            "lightBg": "#FFFFFF",
            "darkBg": "#26282F"
        },
        "Reply": {
            "primary": "#344955",      // Dark blue
            "accent": "#F9AA33",       // Orange
            "lightBg": "#FFFFFF",
            "darkBg": "#1C2326"
        },
        "Shrine": {
            "primary": "#FEDBD0",      // Pink
            "accent": "#FEEAE6",       // Light pink
            "lightBg": "#FFFFFF",
            "darkBg": "#442C2E"
        },
        "Dark Cyan": {
            "primary": "#006064",      // Dark cyan
            "accent": "#00ACC1",       // Cyan
            "lightBg": "#E0F7FA",
            "darkBg": "#004D51"
        },
        "White Cyan": {
            "primary": "#00BCD4",      // Cyan
            "accent": "#80DEEA",       // Light cyan
            "lightBg": "#F0F9FF",
            "darkBg": "#006064"
        }
    })

    // Apply current theme
    Material.theme: isDarkMode ? Material.Dark : Material.Light
    Material.primary: themes[currentTheme].primary
    Material.accent: themes[currentTheme].accent
    Material.background: isDarkMode ? themes[currentTheme].darkBg : themes[currentTheme].lightBg

    // Header with theme switcher
    header: ToolBar {
        Material.background: Material.primary

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Label {
                text: "Material Design Demo"
                font.pixelSize: 18
                font.bold: true
                Layout.leftMargin: 15
            }

            Item { Layout.fillWidth: true }

            // Theme selector
            Label {
                text: "Theme:"
                Layout.rightMargin: 5
            }

            ComboBox {
                id: themeSelector
                model: ["Basil", "Crane", "Fortnightly", "Owl", "Rally", "Reply", "Shrine", "Dark Cyan", "White Cyan"]
                currentIndex: 0
                Layout.preferredWidth: 150
                onCurrentTextChanged: {
                    window.currentTheme = currentText
                }
            }

            // Dark/Light mode toggle
            Button {
                text: window.isDarkMode ? "Light Mode" : "Dark Mode"
                flat: true
                onClicked: {
                    window.isDarkMode = !window.isDarkMode
                }
                Layout.rightMargin: 15
            }
        }
    }

    // Main content
    ScrollView {
        anchors.fill: parent
        anchors.margins: 20

        ColumnLayout {
            width: parent.width - 40
            spacing: 25

            // Buttons Section
            GroupBox {
                title: "Buttons"
                Layout.fillWidth: true

                RowLayout {
                    spacing: 15

                    Button {
                        text: "Contained"
                        highlighted: true
                    }

                    Button {
                        text: "Outlined"
                        flat: false
                    }

                    Button {
                        text: "Text Button"
                        flat: true
                    }

                    Button {
                        text: "Disabled"
                        enabled: false
                    }
                }
            }

            // Progress Bars Section
            GroupBox {
                title: "Progress Indicators"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 15

                    ProgressBar {
                        Layout.fillWidth: true
                        value: 0.7
                    }

                    ProgressBar {
                        Layout.fillWidth: true
                        indeterminate: true
                    }

                    BusyIndicator {
                        running: true
                    }
                }
            }

            // Radio Buttons Section
            GroupBox {
                title: "Radio Buttons"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 10

                    RadioButton {
                        text: "Option 1"
                        checked: true
                    }
                    RadioButton {
                        text: "Option 2"
                    }
                    RadioButton {
                        text: "Option 3 (Disabled)"
                        enabled: false
                    }
                }
            }

            // ComboBox Section
            GroupBox {
                title: "ComboBox"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 10

                    ComboBox {
                        Layout.fillWidth: true
                        model: ["First Item", "Second Item", "Third Item", "Fourth Item"]
                    }

                    ComboBox {
                        Layout.fillWidth: true
                        editable: true
                        model: ["Editable", "ComboBox", "Type here..."]
                    }
                }
            }

            // Table Section
            GroupBox {
                title: "Table View"
                Layout.fillWidth: true
                Layout.preferredHeight: 250

                ListView {
                    id: tableView
                    anchors.fill: parent
                    clip: true

                    model: ListModel {
                        ListElement { name: "Alice Johnson"; role: "Developer"; status: "Active" }
                        ListElement { name: "Bob Smith"; role: "Designer"; status: "Active" }
                        ListElement { name: "Charlie Brown"; role: "Manager"; status: "Away" }
                        ListElement { name: "Diana Prince"; role: "Developer"; status: "Active" }
                        ListElement { name: "Eve Adams"; role: "QA Engineer"; status: "Busy" }
                    }

                    header: Rectangle {
                        width: tableView.width
                        height: 40
                        color: Material.primary

                        Row {
                            anchors.fill: parent
                            spacing: 0

                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: "Name"
                                color: "white"
                                font.bold: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: "Role"
                                color: "white"
                                font.bold: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: "Status"
                                color: "white"
                                font.bold: true
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }

                    delegate: ItemDelegate {
                        width: tableView.width
                        height: 50

                        Row {
                            anchors.fill: parent
                            spacing: 0

                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: name
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: role
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                            Label {
                                width: parent.width / 3
                                height: parent.height
                                text: status
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }
            }

            // Other Controls Section
            GroupBox {
                title: "Other Controls"
                Layout.fillWidth: true

                ColumnLayout {
                    spacing: 15

                    CheckBox {
                        text: "I agree to the terms and conditions"
                        checked: true
                    }

                    Switch {
                        text: "Enable notifications"
                    }

                    Slider {
                        Layout.fillWidth: true
                        value: 0.5
                    }

                    TextField {
                        Layout.fillWidth: true
                        placeholderText: "Enter your name..."
                    }
                }
            }
        }
    }
}
