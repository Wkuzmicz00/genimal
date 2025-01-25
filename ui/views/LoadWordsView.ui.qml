import QtQuick
import QtQuick.Controls
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

    BackButton {
        id: backButton
        x: 25
        y: 642
    }

    CustomTextHolder {
        x: 112
        y: 88
        width: 700
        height: 430

        Image {
            id: _right
            x: 639
            y: 256
            source: "../assets/images/Right.png"
            rotation: 98.222
            fillMode: Image.PreserveAspectFit
        }
    }

    Image {
        id: branch
        x: 834
        y: 233
        source: "../assets/images/Branch.png"
        rotation: -20.23
        fillMode: Image.PreserveAspectFit
    }

    CustomButton {
        id: customButton2
        x: 518
        y: 541
        width: 286
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 476
        buttonText: "FIND YOUR TWIN"
        fontSize: 20
        buttonColor: "#8e2e85"
        nextScreen: "../views/ResultView.ui.qml"
    }

    // Decorative shapes

        Text {
            id: _text
            x: 842
            y: 286
            width: 385
            height: 34
            color: "#ffffff"
            text: qsTr("\"Be yourself; everyone else is already taken.\" ")
            font.pixelSize: 20
            font.italic: true
        }

        Image {
            id: _left
            x: 69
            y: 135
            source: "../assets/images/Left.png"
            rotation: -105.811
            fillMode: Image.PreserveAspectFit
        }
}

