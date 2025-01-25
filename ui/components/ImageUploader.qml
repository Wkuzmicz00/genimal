import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import qmlFiles

Item {
    id: imageUploader
    width: 620
    height: 620

    // Tło dla komponentu
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: 10
        border.color: "#ffffff"
        border.width: 2

        Image {
            id: doubleSparkle
            x: 500
            y: 8
            source: "../assets/images/Double Sparkle.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    // Obraz użytkownika
    Image {
        id: userImage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 54
        width: parent.width * 0.9
        height: parent.height * 0.75
        fillMode: Image.PreserveAspectFit
        source: ""
        anchors.horizontalCenterOffset: 0
        mirror: false
        mipmap: true
        asynchronous: true
        autoTransform: true

    }

    // Przycisk do wgrywania zdjęcia
    ImageButton {
        id: uploadButton
        y: 447
        width: 194
        height: 45
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.horizontalCenterOffset: 0
        buttonText: "UPLOAD PHOTO"
    }

}
