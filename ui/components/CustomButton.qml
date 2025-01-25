import QtQuick
import QtQuick.Controls 2.15

import qmlFiles

Rectangle {
    id: customButton
        width: 530
        height: 105
        radius: 10
        color: "transparent"
        border.color: "white"
        border.width: 3

        property string buttonText
        property string buttonColor
        property string nextScreen: ""
        property int fontSize
        Text {
            id : _test
            anchors.centerIn: parent
            text: buttonText
            font.pixelSize: fontSize
            color: "white"
        }
        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: customButton
                    color: buttonColor
                }
            }
        ]

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

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked:
            {
                stackView.push(nextScreen)
            }
        }
}
