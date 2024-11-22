

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Studio.Effects
import FlowView
import QtGrpc
import QtMultimedia
import QtQuick.Layouts

import qmlFiles
import "../components"

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height
    radius: 0
    border.color: "#000000"
    BorderImage {
        id: borderImage1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 8
        anchors.rightMargin: 1385
        anchors.topMargin: 591
        anchors.bottomMargin: 55
        source: "../assets/images/woodSpiralMagenta.png"
    }
    BorderImage {
        id: borderImage2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1385
        anchors.rightMargin: 8
        anchors.topMargin: 591
        anchors.bottomMargin: 55
        source: "../assets/images/woodSpiralBlue.png"
    }

    Text {
        anchors.centerIn: parent
        font.family: Constants.font.family
    }

    Image {
        id: image
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 601
        anchors.rightMargin: 600
        anchors.topMargin: 8
        anchors.bottomMargin: 336
        source: "../assets/images/logo.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: _text2
        color: "#ffffff"
        text: qsTr("N")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 840
        anchors.rightMargin: 982
        anchors.topMargin: 532
        anchors.bottomMargin: 410
        font.pixelSize: 100
        font.styleName: "Semibold"
    }
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#000000"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
        orientation: Gradient.Horizontal
    }

    Text {
        id: _text3
        color: "#ffffff"
        text: qsTr("I")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 926
        anchors.rightMargin: 909
        anchors.topMargin: 532
        anchors.bottomMargin: 403
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Text {
        id: _text4
        color: "#ffffff"
        text: qsTr("E")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 774
        anchors.rightMargin: 1048
        anchors.topMargin: 532
        anchors.bottomMargin: 403
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Text {
        id: _text5
        color: "#ffffff"
        text: qsTr("M")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 965
        anchors.rightMargin: 857
        anchors.topMargin: 532
        anchors.bottomMargin: 397
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Text {
        id: _text6
        color: "#ffffff"
        text: qsTr("A")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1072
        anchors.rightMargin: 750
        anchors.topMargin: 532
        anchors.bottomMargin: 414
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Text {
        id: _text7
        color: "#ffffff"
        text: qsTr("L")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1150
        anchors.rightMargin: 686
        anchors.topMargin: 532
        anchors.bottomMargin: 397
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Text {
        id: _text1
        y: 672
        height: 36
        color: "#eaeaea"
        text: qsTr("Znajdź swojego zwierzaka bliźniaka ")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 766
        anchors.rightMargin: 766
        font.pixelSize: 25
    }

    Item {
        id: _item2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 1258
        anchors.rightMargin: 69
        anchors.topMargin: 799
        anchors.bottomMargin: 127
    }
    Text {
        id: _text8
        color: "#ffffff"
        text: qsTr("G")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 693
        anchors.rightMargin: 1129
        anchors.topMargin: 532
        anchors.bottomMargin: 403
        font.pixelSize: 100
        font.styleName: "Semibold"
    }

    Item {
        id: __materialLibrary__
    }

    Rectangle {
        id: rectangle1
        x: 1406
        y: 35
        width: 514
        height: 7
        color: "grey"
    }

    Rectangle {
        id: rectangle2
        x: 1508
        y: 54
        width: 412
        height: 5
        color: "grey"
    }

    Rectangle {
        id: rectangle3
        x: 0
        y: 35
        width: 514
        height: 7
        color: "grey"
    }

    Rectangle {
        id: rectangle4
        x: 0
        y: 54
        width: 412
        height: 5
        color: "grey"
    }

    CustomButton {
        id: customButton
        x: 109
        y: 824
        buttonText: "WYBIERZ FOTKE"
        buttonColor: "#f70287"
        nextScreen: "../views/LoadFileView.ui.qml"
    }

    CustomButton {
        id: customButton1
        x: 1272
        y: 824
        buttonText: "WYPISZ CECHY"
        buttonColor: "#25a3f9"
    }
}
