import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Effects
import QtMultimedia
import QtQuick.Layouts

import qmlFiles
import components

Rectangle {
     id: rectangle
     width: Constants.width
     height: Constants.height
     border.color: "#000000"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#3f51b1"
        }

        GradientStop {
            position: 0.13
            color: "#5a55ae"
        }

        GradientStop {
            position: 0.25
            color: "#7b5fac"
        }

        GradientStop {
            position: 0.38
            color: "#8f6aae"
        }

        GradientStop {
            position: 0.5
            color: "#a86aa4"
        }

        GradientStop {
            position: 0.62
            color: "#cc6b8e"
        }

        GradientStop {
            position: 0.75
            color: "#f18271"
        }

        GradientStop {
            position: 0.87
            color: "#f3a469"
        }

        GradientStop {
            position: 1
            color: "#f7c978"
        }
        orientation: Gradient.Vertical
    }

    Item {
        id: __materialLibrary__
    }

    CustomButton {
        id: customButton
        y: 247
        width: 414
        height: 76
        anchors.left: parent.left
        anchors.leftMargin: 50
        buttonText: "CHOOSE PHOTO"
        fontSize: 30
        buttonColor: "#8e2e85"
        nextScreen: "../views/LoadFileView.ui.qml"
    }

    CustomButton {
        id: customButton1
        x: 50
        y: 425
        width: 414
        height: 76
        anchors.right: parent.right
        anchors.rightMargin: 816
        buttonText: "YOUR PERSONALITY"
        fontSize: 30
        buttonColor: "#8e2e85"
        nextScreen: "../views/LoadWordsView.ui.qml"
    }

    Image {
        id: image1
        x: 475
        y: 247
        width: 90
        height: 80
        source: "../assets/images/Image.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: pencil
        x: 480
        y: 419
        width: 81
        height: 82
        source: "../assets/images/Pencil.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: group5357
        x: 621
        y: 172
        width: 651
        height: 396
        source: "../assets/images/laptop.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: image
            x: 115
            y: 16
            width: 422
            height: 400

            source: "../assets/images/logo.png"
            fillMode: Image.PreserveAspectFit
        }

        GenimalText {
            id: _text
            x: -593
            y: -100
            width: 496
            height: 104
        }
    }

    Rectangle {
        id: decorativeLine1
        x: 3
        y: 349
        width: 600
        height: 5
        color: "#ffffff"
    }

    Rectangle {
        id: decorativeLine2
        x: 3
        y: 531
        width: 600
        height: 5
        color: "#ffffff"
    }


    Text {
        id: _text1
        x: 317
        y: 634
        width: 272
        height: 29
        color: "#ffffff"
        text: qsTr("Check what animal is your twin")
        font.pixelSize: 20
        font.italic: true
    }

    Image {
        id: _right
        x: 548
        y: 556
        source: "../assets/images/Right.png"
        rotation: 109.193
        fillMode: Image.PreserveAspectFit
    }
 }
