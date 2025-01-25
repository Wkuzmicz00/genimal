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
        fontSize: 30
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
        fontSize: 30
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
        id: group5357
        x: 609
        y: 178
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
            x: -591
            y: -82
            width: 496
            height: 104
        }
    }

    // Prostokąt dekoracyjny w rogu

    // Ozdobne linie
    Rectangle {
        id: decorativeLine1
        x: 3
        y: 349
        width: 600
        height: 5
        color: "#ffffff"
    }

    Rectangle {
        id: decorativeLine2
        x: 3
        y: 531
        width: 600
        height: 5
        color: "#ffffff"
    }

    // Koła dekoracyjne

    // Element siatki w tle
    Repeater {
        model: 5
        delegate: Rectangle {
            width: 20
            height: 20
            x: index * 50 + 833
            y: 600 + (index % 2) * 30
            color: "#ffffff"
            radius: 4
        }
    }
}
