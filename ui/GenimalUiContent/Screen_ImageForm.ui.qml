/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import QtQuick.Controls
import GenimalUi 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    Item {
        width: 1920
        height: 1080
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
    }
    Item {
        id: _item3
        y: 860
        width: 171
        height: 70
        anchors.left: parent.left
        anchors.leftMargin: 172

        Loader {
            id: buttonLoader3
            x: 61
            width: 50
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            source: "Back_Button.qml"
            anchors.verticalCenterOffset: 0

            Connections {
                target: buttonLoader3
                onEnabledChanged: rectangle.visible = rectangle.visible
            }
        }
    }
    ImageUploader {
            anchors.centerIn: parent
            width: 563
            height: 771
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 75
            anchors.topMargin: 75
            anchors.verticalCenterOffset: -80
            anchors.horizontalCenterOffset: -588
    }
}
