import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Item {
    width: 720

    Rectangle {
        id: rectangle
        x: 8
        y: 34
        width: 704
        height: 400
        color: "#d9d9d9"

        Image {
            id: image
            x: 371
            y: 7
            width: 342
            height: 392
            source: "assets/phone.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image1
            x: 22
            y: 102
            width: 71
            height: 71
            source: "assets/bluetoothoff.png"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            x: 99
            y: 122
            text: qsTr("No device connected")
            font.pointSize: 20
        }

        ToolSeparator {
            id: toolSeparator
            x: 126
            y: 179
            width: 202
            height: 19
            orientation: Qt.Horizontal
        }

        Button {
            id: button
            x: 168
            y: 229
            text: qsTr("Connect")
            font.pointSize: 20
        }
    }

}
