import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import qmlFiles

Rectangle {
    id: imageButton
        width: 530
        height: 105
        radius: 10
        color: "transparent"
        border.color: "white"
        border.width: 2

        property string buttonText
        property string buttonColor

        Text {
            id : _test
            anchors.centerIn: parent
            text: buttonText
            font.pixelSize: 20
            color: "white"
        }
        states: [
            State {
                name: "pressed"
                when: mouseArea.pressed
                PropertyChanges {
                    target: imageButton
                    color: buttonColor
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "pressed"
                ColorAnimation {
                    target: imageButton
                    property: "color"
                    duration: 200
                }
            },
            Transition {
                from: "pressed"
                to: "*"
                ColorAnimation {
                    target: imageButton
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
                fileDialog.open()
            }
        }

        FileDialog {
            id: fileDialog
            title: "Wybierz zdjęcie"
            nameFilters: ["Obrazy (*.png *.jpg *.jpeg)"]
            onAccepted: {
                if (fileDialog.currentFile) {
                    userImage.source = fileDialog.currentFile
                    imageSource = userImage.source
                } else {
                    _text1.text = "Nie wybrano pliku"
                }
            }
            onRejected: {
                console.log("Wybór pliku anulowany")
            }
        }
}

