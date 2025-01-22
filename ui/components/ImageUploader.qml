import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import qmlFiles

Item {
    id: imageUploader
    width: 600
    height: 600

    // Tło dla komponentu
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: 10
        border.color: "#ffffff"
        border.width: 2
    }

    // Obraz użytkownika
    Image {
        id: userImage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        width: parent.width * 0.9
        height: parent.height * 0.84
        fillMode: Image.PreserveAspectFit
        source: ""
        mirror: false
        mipmap: true
        asynchronous: true
        autoTransform: true

    }

    // Przycisk do wgrywania zdjęcia
    ImageButton {
        id: uploadButton
        y: 631
        width: 194
        height: 45
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 24
        anchors.horizontalCenterOffset: 0
        buttonText: "UPLOAD PHOTO"
    }

}
