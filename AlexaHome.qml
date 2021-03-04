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
            x: 181
            y: -38
            width: 342
            height: 386
            source: "assets/alexa.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1
            x: 280
            y: 314
            text: qsTr("Tap to talk")
            font.pixelSize: 30
            minimumPixelSize: 22
        }
    }

}
