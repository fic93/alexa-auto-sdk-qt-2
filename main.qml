import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Window {
    width: 720
    height: 480
    visible: true
    title: qsTr("Alexa")

    TabBar {
        id: bar
        x: 0
        y: 440
        width: parent.width
        TabButton {
                id: alexa
                icon.source: "assets/microphone.png"
        }
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
AlexaHome{}
        }
        Item {
            ClimateScreen{
            }
        }
        Item {
            MediaScreen{}
        }
        Item {
            PhoneScreen{}
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

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 720
        height: 30
        color: "#d9d9d9"

        Label {
            id: label
            x: 38
            y: 7
            text: qsTr("Artist - Song")
        }

        Label {
            id: label1
            x: 596
            y: 7
            text: qsTr("WED, 16/11 12:00 ")
        }
    }

    Image {
        id: image
        x: 6
        y: 3
        width: 24
        height: 24
        source: "assets/music.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 458
        y: 4
        width: 23
        height: 23
        source: "assets/signal.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 497
        y: 1
        width: 29
        height: 29
        source: "assets/wifi.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image3
        x: 537
        y: 4
        width: 22
        height: 22
        source: "assets/bluetoothoff.png"
        fillMode: Image.PreserveAspectFit
    }



}
