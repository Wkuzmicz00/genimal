import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects

Rectangle {
    id: rectangle
    width: 500
    height: 300
    color: "transparent"

    Text {
        id: animatedText
        text: "GENIMAL"
        font.letterSpacing: 0.6
        color: "white"
        font.pixelSize: 70
        lineHeight: 1
        font.wordSpacing: 0.7
        font.bold: true
        anchors.centerIn: parent

        DesignEffect {
            effects: [
                DesignDropShadow {
                }
            ]
        }
    }
}
