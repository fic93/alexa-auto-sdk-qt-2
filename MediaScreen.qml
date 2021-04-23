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
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#3d4e81"
            }

            GradientStop {
                position: 0.48
                color: "#5753c9"
            }

            GradientStop {
                position: 1
                color: "#6e7ff3"
            }
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
                highlighted: false
                icon.source: "assets/prev.svg"
            }

            RoundButton {
                id: roundButton2
                x: 160
                y: 316
                highlighted: false
                icon.source: "assets/play.png"
            }

            RoundButton {
                id: roundButton3
                x: 222
                y: 316
                highlighted: false
                icon.source: "assets/next.svg"
            }

            ProgressBar {
                id: progressBar
                x: 80
                y: 282
                value: 0.5
            }


    }

    Rectangle {
        id: rectangle1
        x: 373
        y: 34
        width: 339
        height: 400
        color: "#d9d9d9"

        MediaPlayer {
                id: mediaplayer
                source: "assets/movie.mp4"
            }

            VideoOutput {
                anchors.fill: parent
                source: mediaplayer
            }

            MouseArea {
                id: playArea
                anchors.fill: parent
                onPressed: mediaplayer.play();
            }
    }

}
