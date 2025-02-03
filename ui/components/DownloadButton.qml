import QtQuick
import QtQuick.Controls

import qmlFiles


Rectangle {
    id: downloadButton
        width: 50
        height: 50
        radius: 10
        color: "transparent"
        border.color: "white"
        border.width: 2
        Image {
            id: image
            x: 8
            y: 8
            width: 35
            height: 35
            source: "../assets/images/Disk.png"
            fillMode: Image.PreserveAspectFit
        }

        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: downloadButton
                    color: "#25a3f9"
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "pressed"
                ColorAnimation {
                    target: downloadButton
                    property: "color"
                    duration: 200
                }
            },
            Transition {
                from: "pressed"
                to: "*"
                ColorAnimation {
                    target: downloadButton
                    property: "color"
                    duration: 200
                }
            }
        ]

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            onClicked: {
                controller.create_raport()
            }
        }
}
