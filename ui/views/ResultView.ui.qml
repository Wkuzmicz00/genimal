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
            color: "#d299c2"
        }

        GradientStop {
            position: 1
            color: "#fef9d7"
        }
        orientation: Gradient.Vertical
    }

    Results {
        width: 750
        height: 500
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 484
        anchors.topMargin: 110
    }
    HomeButton{
        x: 25
        y: 642
    }

    Text {
        id: _text
        x: 484
        y: 61
        width: 247
        height: 43
        color: "#ffffff"
        text: qsTr("YOUR TWIN IS:")
        font.pixelSize: 30
        font.bold: false
    }
}
