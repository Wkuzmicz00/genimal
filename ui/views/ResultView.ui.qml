/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
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
    Image{
        id: image
        x: 236
        y: 38
        width: 822
        height: 644
        source: "../assets/images/Group 457.png"
        fillMode: Image.PreserveAspectFit
        Results {
            height: 484
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.leftMargin: 50
            anchors.rightMargin: 50
            anchors.topMargin: 15
        }
    }
    Image {
        id: cat
        x: 644
        y: 594
        width: 165
        height: 88
        source: "../assets/images/Cat.png"
        fillMode: Image.PreserveAspectFit
    }
    HomeButton{
        x: 25
        y: 642
    }

    Image {
        id: dog
        x: -39
        y: 581
        width: 177
        height: 64
        source: "../assets/images/Dog.png"
        mirror: true
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: _37
        x: 184
        y: 18
        source: "../assets/images/37.png"
        fillMode: Image.PreserveAspectFit
    }

}
