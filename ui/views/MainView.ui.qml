

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
    width: 1280
    height: 720
    radius: 5
    border.color: "#000000"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#d9afd9"
        }

        GradientStop {
            position: 1
            color: "#97d9e1"
        }
        orientation: Gradient.Vertical
    }



    Item {
        id: __materialLibrary__
    }

    CustomButton {
        id: customButton
        y: 247
        width: 414
        height: 76
        anchors.left: parent.left
        anchors.leftMargin: 50
        buttonText: "CHOOSE PHOTO"
        buttonColor: "#8e2e85"
        nextScreen: "../views/LoadFileView.ui.qml"


    }

    CustomButton {
        id: customButton1
        x: 50
        y: 425
        width: 414
        height: 76
        anchors.right: parent.right
        anchors.rightMargin: 816
        buttonText: "YOUR PERSONALITY"
        buttonColor: "#8e2e85"
        nextScreen: "../views/LoadWordsView.ui.qml"
    }



    Image {
        id: image1
        x: 475
        y: 247
        width: 90
        height: 80
        source: "../assets/images/Image.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: pencil
        x: 480
        y: 419
        width: 81
        height: 82
        source: "../assets/images/Pencil.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: ellipse
        x: 910
        y: -32
        width: 464
        height: 239
        source: "../assets/images/Ellipse.png"
        rotation: 18.017
        fillMode: Image.PreserveAspectFit


        Text {
            id: _text1
            x: 148
            y: 117
            width: 173
            height: 18
            color: "#ffffff"
            text: qsTr("check what animal is your twin")
            font.pixelSize: 12
            rotation: -9.63
            font.family: "Verdana"
            font.italic: true
            font.weight: Font.Medium
        }
    }

    Image {
        id: group5357
        x: 609
        y: 191
        width: 663
        height: 403
        source: "../assets/images/Group 457.png"
        fillMode: Image.PreserveAspectFit

        Image {
            id: image
            x: 186
            y: 58
            width: 291
            height: 273

            source: "../assets/images/logo.png"
            fillMode: Image.PreserveAspectFit

        }

        GenimalText {
            id: _text
            x: -582
            y: -100
            width: 496
            height: 104
        }
    }

    Image {
        id: menuSeparator
        x: -41
        y: 350
        width: 724
        height: 57
        source: "../assets/images/Menu Separator.png"
        fillMode: Image.PreserveAspectFit
    }
}
