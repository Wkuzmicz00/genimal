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

        // MouseArea dla interakcji
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
            nameFilters: ["Obrazy (*.png *.jpg *.jpeg)"] // Obsługiwane formaty
            onAccepted: {
                if (fileDialog.currentFile) {
                    userImage.source = fileDialog.currentFile // Przypisanie do obrazu
                } else {
                    _text1.text = "Nie wybrano pliku"
                }
            }
            onRejected: {
                console.log("Wybór pliku anulowany")
            }
        }
}

