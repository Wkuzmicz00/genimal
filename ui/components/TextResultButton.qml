import QtQuick
import QtQuick.Controls

Rectangle {
    id: resultButton
        width: 278
        height: 47
        radius: 10
        color: "transparent"
        border.color: "white"
        border.width: 3
        property string buttonColor

        Text {
            id : _test
            anchors.centerIn: parent
            text: "FIND MY TWIN"
            font.pixelSize: 20
            color: "white"
        }
        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: resultButton
                    color: buttonColor
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "pressed"
                ColorAnimation {
                    target: resultButton
                    property: "color"
                    duration: 200
                }
            },
            Transition {
                from: "pressed"
                to: "*"
                ColorAnimation {
                    target: resultButton
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
                stackView.push("../views/ResultView.ui.qml")
                controller.process_text(textHolder.text)
            }
        }
}
