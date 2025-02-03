

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

    ImageUploader {
        id: imageUploader
        anchors.centerIn: parent
        width: 620
        height: 620
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 482
        anchors.topMargin: 304
        anchors.verticalCenterOffset: 1
        anchors.horizontalCenterOffset: -181
    }

    BackButton {
        id: backButton
        x: 33
        y: 630
    }

    Image {
        id: videoCall
        x: 814
        y: 81
        width: 438
        height: 440
        source: "../assets/images/Video Call.png"
        fillMode: Image.PreserveAspectFit

        Text {
            id: _text
            x: 42
            y: 397
            width: 218
            height: 35
            color: "white"
            text: qsTr("You look beautiful today")
            font.pixelSize: 20
            font.italic: true
        }

        Image {
            id: group2
            x: 266
            y: 389
            width: 31
            height: 36
            source: "../assets/images/happy.png"
            fillMode: Image.PreserveAspectFit
        }
    }
    ImageResultButton {
        id: customButton2
        x: 894
        y: 614
        width: 278
        height: 47
        anchors.right: parent.right
        anchors.rightMargin: 108
        buttonColor: "#8e2e85"
    }

    Image {
        id: group3
        x: 877
        y: 626
        width: 30
        height: 63
        source: "../assets/images/arrow.png"
        rotation: 62.115
        fillMode: Image.PreserveAspectFit
    }
}
