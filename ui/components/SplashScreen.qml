import QtQuick
import QtQuick.Controls
import qmlFiles

Window {
    id: splashWindow
    width: Constants.width
    height: Constants.height
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

    AnimatedImage {
        id: image
        y: 33
        height: 600
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 240
        anchors.rightMargin: 240
        source: "../assets/images/animation.gif"
        fillMode: Image.PreserveAspectFit


    }

    Rectangle {
        id: progressBarBackground
        y: 656
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 54
        anchors.horizontalCenterOffset: 0
        width: parent.width * 0.6
        height: 10
        color: "#f1f4f7"
        radius: 5

        Rectangle {
            id: progressBar
            width: progressBarBackground.width * (progress / 100)
            height: progressBarBackground.height
            radius: progressBarBackground.radius
            anchors.left: progressBarBackground.left
            color: progressColor

            Behavior on color {
                ColorAnimation {
                    duration: 500
                }
            }
        }
    }

    Text {
        id: loadingText
        y: 624
        text: "Loading" + dots
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: progressBarBackground.top
        anchors.bottomMargin: 22
        anchors.horizontalCenterOffset: 0
        font.weight: Font.ExtraBold
        font.pointSize: 28
        color: "#ffffff"
    }

    Timer {
        id: dotTimer
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            if (dots.length < 3) {
                dots += ".";
            } else {
                dots = "";
            }
        }
    }

    Timer {
        id: progressTimer
        interval: 50
        repeat: true
        running: true
        onTriggered: {
            if (progress < 100) {
                progress += 1;
            } else {
                progressTimer.stop();
                dotTimer.stop();
            }
        }
    }

    property int progress: 0

    property string progressColor: "#24a5fb"

    property string dots: ""

    onProgressChanged: {
        if (progress < 33) {
            progressColor = "#24a5fb";
        } else if (progress < 66) {
            progressColor = "#e711ff";
        } else {
            progressColor = "#ff770e";
        }
    }
}
