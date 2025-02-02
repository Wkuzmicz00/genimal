import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import qmlFiles

Item {
    id: imageUploader
    width: 620
    height: 620

    property string imageSource: ""

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: 10
        border.color: "#ffffff"
        border.width: 3

        Image {
            id: doubleSparkle
            x: 524
            y: 8
            width: 88
            height: 81
            source: "../assets/images/Double Sparkle.png"
            fillMode: Image.PreserveAspectFit
        }
    }
    Rectangle{
        id: rectangle
        height: parent.height * 0.8
        width: parent.width * 0.9
        color: "transparent"
        radius: 10
        border.width: 2
        border.color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 31
        anchors.rightMargin: 31
        anchors.topMargin: 31
        Image {
            id: userImage
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 28
            anchors.rightMargin: 28
            anchors.topMargin: 50
            anchors.bottomMargin: 50
            anchors.left: parent.left
            anchors.right: parent.right
            fillMode: Image.PreserveAspectFit
            source: ""
            mirror: false
            mipmap: true
            asynchronous: true
            autoTransform: true

        }
    }


    ImageButton {
        id: uploadButton
        y: 554
        width: 194
        height: 45
        buttonColor: "pink"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 21
        anchors.horizontalCenterOffset: 0
        buttonText: "UPLOAD PHOTO"
    }

}
