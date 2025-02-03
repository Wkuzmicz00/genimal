import QtQuick
import QtQuick.Controls

import qmlFiles



Rectangle {
    id: rectangle
    anchors.fill: parent
    width: 700
    height: 430
    x: 0
    y: 0
    color: "transparent"
    border.color: "white"
    border.width: 3
    radius: 10
    property string text: ""

    TextEdit {
        id: textArea
        property int charLimit: 650
        x: 0
        y: 0
        width: 700
        height: 430
        font.pixelSize: 20
        color: "white"
        padding: 10
        wrapMode: TextEdit.Wrap

        onTextChanged: {
            if (text.length > textArea.charLimit) {
                text = text.slice(0, textArea.charLimit);
            }
            rectangle.text = text
        }

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Tab) {
                event.accepted = true;
            } else if (text.length >= textArea.charLimit) {
                if (event.key !== Qt.Key_Backspace && event.key !== Qt.Key_Delete) {
                    event.accepted = true;
                }
            } else {
                event.accepted = false;
            }
        }
    }
    Text {
            id: placeholderText
            x: 8
            y: 10
            text: "DESCRIBE YOURSELF"
            color: "white"
            font.pixelSize: 20
            anchors.verticalCenterOffset: -193
            anchors.horizontalCenterOffset: -251
            anchors.centerIn: textArea
            visible: textArea.text.length === 0
        }
}

