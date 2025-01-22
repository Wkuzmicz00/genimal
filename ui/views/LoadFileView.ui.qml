

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
    id: root
    width: Constants.width
    height: Constants.height
    radius: 5
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#e14fad"
        }

        GradientStop {
            position: 1
            color: "#f9d423"
        }
        orientation: Gradient.Vertical
    }
    color: "#000000"


    ImageUploader {
        anchors.centerIn: parent
        width: 600
        height: 600
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 975
        anchors.topMargin: 269
        anchors.verticalCenterOffset: -34
        anchors.horizontalCenterOffset: 312
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
}
