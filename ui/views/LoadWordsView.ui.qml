

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
    radius: 0
    border.color: "#000000"

    BackButton {
        x: 90
        y: 917
        width: 50
        height: 47
        color: "#000000"
    }

    CustomTextHolder {
        x: 98
        y: 271
    }
}
