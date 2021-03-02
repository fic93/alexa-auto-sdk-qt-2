import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Alexa")

    TabBar {
        id: bar
        x: 0
        y: 440
        width: parent.width
        TabButton {
            x: 0
            y: 0
            text: qsTr("Climate")
        }
        TabButton {
            x: 124
            y: 0
            text: qsTr("Media")
        }
        TabButton {
            x: 215
            y: 0
            text: qsTr("Phone")
        }
        TabButton {
            x: 322
            y: 0
            text: qsTr("Navigation")
        }
        TabButton {
            x: 427
            y: 0
            text: qsTr("Diagnostics")
        }
        TabButton {
            x: 533
            y: 0
            text: qsTr("Settings")
        }
    }

    SwipeView {
        width: parent.width
        currentIndex: bar.currentIndex
        Item {
            Text {
                id: climate
                text: qsTr("Climate")
            }
        }
        Item {
            Text {
                id: media
                text: qsTr("Media")
            }
        }
        Item {
            Text {
                id: phone
                text: qsTr("Phone")
            }
        }
        Item {
            Text {
                id: navigation
                text: qsTr("Navigation")
            }
        }
        Item {
            Text {
                id: diagnostics
                text: qsTr("Diagnostics")
            }
        }
        Item {
            Text {
                id: settings
                text: qsTr("Settings")
            }
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
