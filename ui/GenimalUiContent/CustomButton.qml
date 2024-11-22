import QtQuick
import QtQuick.Controls 2.15
import GenimalUi 1.0

Rectangle {
    id: customButton
        width: 530
        height: 105
        radius: 10
        color: "black" // Domyślny kolor
        border.color: "gray"
        border.width: 2

        property string buttonText
        property string buttonColor
        property string nextScreen: ""
        // Tekst w przycisku
        Text {
            id : _test
            anchors.centerIn: parent
            text: buttonText
            font.pixelSize: 40
            color: "gray"
        }
        // Stany przycisku
        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: customButton
                    color: buttonColor // Kolor wciśnięcia
                }
            }
        ]

        // Animacje
        transitions: [
            Transition {
                from: "*"
                to: "pressed"
                ColorAnimation {
                    target: customButton
                    property: "color"
                    duration: 200
                }
            },
            Transition {
                from: "pressed"
                to: "*"
                ColorAnimation {
                    target: customButton
                    property: "color"
                    duration: 200
                }
            }
        ]

        // MouseArea dla interakcji
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked:
            {
                stackView.push(nextScreen)
            }
        }
}
