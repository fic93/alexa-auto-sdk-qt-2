import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.15

Item {
    width: 720

    Rectangle {
        id: rectangle
        x: 8
        y: 34
        width: 359
        height: 400
        color: "#d9d9d9"
        MediaPlayer {
            id: mediaplayer
            source: "groovy_video.mp4"
        }

            Image {
                id: image
                x: 98
                y: 36
                width: 164
                height: 164
                source: "assets/cover.png"
                fillMode: Image.PreserveAspectFit
            }

            Label {
                id: label
                x: 85
                y: 217
                text: qsTr("Artist - Song Title")
                font.pointSize: 18
            }


            RoundButton {
                id: roundButton1
                x: 98
                y: 316
                icon.source: "assets/prev.svg"
            }

            RoundButton {
                id: roundButton2
                x: 160
                y: 316
                icon.source: "assets/play.png"
            }

            RoundButton {
                id: roundButton3
                x: 222
                y: 316
                icon.source: "assets/next.svg"
            }

            ProgressBar {
                id: progressBar
                x: 80
                y: 282
                value: 0.5
            }


    }

}
