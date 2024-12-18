

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
    color: "#000000"

    BackButton {
        id: backButton
        x: 190
        y: 899
        color: "#000000"
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
