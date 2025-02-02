import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtMultimedia
import QtQuick.Layouts

import qmlFiles
import components

Rectangle {
    id: rectangle1
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
        id: textHolder
        x: 112
        y: 88
        width: 700
        height: 430
        anchors.leftMargin: 115
        anchors.rightMargin: 477
        anchors.topMargin: 115
        anchors.bottomMargin: 202

        Image {
            id: _right
            x: 629
            y: 216
            source: "../assets/images/Right.png"
            rotation: 98.222
            fillMode: Image.PreserveAspectFit
        }
    }

    TextResultButton {
        id: customButton1
        x: 525
        y: 552
        width: 278
        height: 47
        buttonColor: "#cc6b8e"
    }

    Text {
        id: _text
        x: 875
        y: 88
        width: 385
        height: 34
        color: "#ffffff"
        text: qsTr("\"Be yourself; everyone else is already taken.\" ")
        font.pixelSize: 20
        font.italic: true
    }

    Image {
        id: _left
        x: 73
        y: 160
        source: "../assets/images/Left.png"
        rotation: -105.811
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: _39
        x: 923
        y: 301
        width: 289
        height: 217
        source: "../assets/images/men with dog.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: group
        x: 1125
        y: 148
        width: 112
        height: 99
        source: "../assets/images/sun.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: group3
        x: 510
        y: 567
        width: 30
        height: 63
        source: "../assets/images/arrow.png"
        rotation: 62.115
        fillMode: Image.PreserveAspectFit
    }
}
