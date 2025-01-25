

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
        x: 819
        y: 65
        width: 438
        height: 440
        source: "../assets/images/Video Call.png"
        fillMode: Image.PreserveAspectFit

        Text {
            id: _text
            x: 104
            y: 352
            width: 218
            height: 35
            color: "white"
            text: qsTr("You look beautiful today")
            font.pixelSize: 20
            font.italic: true
        }
    }
    CustomButton {
        id: customButton2
        x: 895
        y: 610
        width: 286
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 99
        buttonText: "FIND YOUR TWIN"
        fontSize: 20
        buttonColor: "#8e2e85"
        nextScreen: "../views/ResultView.ui.qml"
    }
}
