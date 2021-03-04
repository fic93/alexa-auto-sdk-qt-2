import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12

Item {
    width: 720

    Rectangle {
        id: leftRectangle
        x: 8
        y: 31
        width: 359
        height: 400
        color: "#d9d9d9"


        Button {
            id: frontWindowAc
            x: 8
            y: 14
            width: 62
            height: 40
            opacity: 1
            icon.source: "assets/ac.png"
        }

        Button {
            id: rearWindowAc
            x: 8
            y: 60
            width: 62
            height: 40
            icon.source: "assets/ac-rear.png"
        }

        Button {
            id: circulate
            x: 8
            y: 106
            width: 62
            height: 40
            icon.source: "assets/ac.svg"
        }

        RoundButton {
            id: fan1
            x: 63
            y: 354
            icon.source: "assets/fan.png"
        }

        RoundButton {
            id: fan2
            x: 109
            y: 354
            icon.source: "assets/fan.png"
        }

        RoundButton {
            id: fan3
            x: 155
            y: 354
            icon.source: "assets/fan.png"
        }

        Image {
            id: image
            x: 114
            y: -10
            width: 247
            height: 376
            source: "assets/person.png"
            fillMode: Image.PreserveAspectFit
        }

        RoundButton {
            id: fan4
            x: 201
            y: 354
            icon.source: "assets/fan.png"
        }

        RoundButton {
            id: fan5
            x: 247
            y: 354
            icon.source: "assets/fan.png"
        }

        Column {
        }

        RoundButton {
            id: roundButton
            x: 140
            y: 63
            width: 70
            height: 70
            icon.source: "assets/arrow.png"
        }

        RoundButton {
            id: roundButton1
            x: 94
            y: 207
            width: 70
            height: 70
            icon.source: "assets/arrow.png"
        }

    }

    Rectangle {
        id: rightRectangle
        x: 380
        y: 31
        width: 332
        height: 400
        color: "#d9d9d9"

        Image {
            id: image1
            x: 181
            y: 35
            width: 127
            height: 148
            source: "assets/heating.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image2
            x: 13
            y: 35
            width: 127
            height: 148
            source: "assets/heating.png"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: label
            x: 140
            y: 362
        }

        RoundButton {
            id: roundButton2
            x: 48
            y: 310
            icon.source: "assets/uparrow.png"
        }

        RoundButton {
            id: roundButton3
            x: 245
            y: 308
            rotation: -180
            icon.source: "assets/uparrow.png"
        }

        Row {
        }

        Rectangle {
            id: rectangle
            x: 116
            y: 278
            width: 101
            height: 101
            color: "#2e3436"
            radius: 50.5

            Label {
                id: label1
                x: 11
                y: 27
                color: "#ffffff"
                text: qsTr("22°C")
                font.family: "Courier"
                font.bold: true
                font.pointSize: 25
            }
        }

        Button {
            id: button
            x: 27
            y: 180
            text: qsTr("Driver")
            Material.accent: Material.Orange
        }

        Button {
            id: button1
            x: 195
            y: 180
            text: qsTr("Passenger")
        }
    }

}
