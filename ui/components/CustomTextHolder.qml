import QtQuick
import QtQuick.Controls 2.15

import qmlFiles

Item{
    width: 700
    height: 430
    id: textAreaHolder
    property string text: ""

    Rectangle {
        id: rectangle
        anchors.fill: parent
        x: 0
        y: 0
        color: "black"
        border.color: "black"
        border.width: 3
        radius: 10


        TextArea {
            id: textArea
            property int charLimit: 650
            width: 700
            height: 430
            font.pixelSize: 20
            placeholderTextColor: "white"
            color: "white"
            placeholderText: "DESCRIBE YOURSELF"
            padding: 10
            wrapMode: TextArea.Wrap

            onTextChanged: {
                if (text.length > textArea.charLimit) {
                    text = text.slice(0, textArea.charLimit);
                }
                textAreaHolder.text = text
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
    }
}
