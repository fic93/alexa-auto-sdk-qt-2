import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtLocation 5.15

Item {
    width: 720

    Rectangle {
        id: rectangle
        x: 8
        y: 34
        width: 704
        height: 400
        color: "#3d4e81"
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
        Plugin {
                id: mapPlugin
                name: "osm" // "mapboxgl", "esri", ...
                // specify plugin parameters if necessary
                // PluginParameter {
                //     name:
                //     value:
                // }
            }

            Map {
                anchors.fill: parent
                anchors.rightMargin: 8
                anchors.bottomMargin: 8
                anchors.leftMargin: 185
                anchors.topMargin: 8
                plugin: mapPlugin
                center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                zoomLevel: 14
            }

            Button {
                id: speakerOff
                x: 41
                y: 113
                width: 100
                height: 82
                highlighted: true
                icon.source: "assets/speakeroff.png"
            }

            Button {
                id: speakerOn
                x: 41
                y: 201
                width: 100
                height: 82
                highlighted: true
                icon.source: "assets/speaker.png"
            }
    }

}
