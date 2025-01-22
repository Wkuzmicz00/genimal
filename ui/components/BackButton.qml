import QtQuick
import QtQuick.Controls

import qmlFiles


Rectangle {
    id: backButton
        width: 50
        height: 50
        radius: 10
        color: "transparent" // Domyślny kolor
        border.color: "white"
        border.width: 2
        Image {
            id: image
            x: 5
            y: 5
            width: 40
            height: 40
            source: "../assets/images/Caret Left.png"
            fillMode: Image.PreserveAspectFit
        }

        // Stany przycisku
        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: customButton
                    color: "#25a3f9" // Kolor wciśnięcia
                }
            }
        ]

        // Animacje
        transitions: [
            Transition {
                from: "*"
                to: "pressed"
                ColorAnimation {
                    target: backButton
                    property: "color"
                    duration: 200
                }
            },
            Transition {
                from: "pressed"
                to: "*"
                ColorAnimation {
                    target: backButton
                    property: "color"
                    duration: 200
                }
            }
        ]

        // MouseArea dla interakcji
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            anchors.rightMargin: 0
            onClicked: {
                stackView.pop()
            }
        }


}
