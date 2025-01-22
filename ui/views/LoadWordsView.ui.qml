

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
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
    color: "#000000"
    radius: 5
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

    Image {
        id: rock
        x: -9
        y: 10
        width: 262
        height: 193
        source: "../assets/images/Rock.png"
        rotation: -303.867
        fillMode: Image.PreserveAspectFit

        BackButton {
            id: backButton
            x: 92
            y: 78
            rotation: -56.679
        }
    }

    CustomTextHolder {
        x: 640
        y: 150
        width: 575
        height: 387
    }

    Image {
        id: branch
        x: 830
        y: 311
        source: "../assets/images/Branch.png"
        rotation: -23.654
        fillMode: Image.PreserveAspectFit
    }
}
