import QtQuick
import QtQuick.Controls

Window {
    id: splashWindow
    width: 800
    height: 600
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

    AnimatedImage {
        id: image
        x: 0
        y: 0
        width: 800
        height: 600
        source: "../assets/images/animation.gif"
        fillMode: Image.PreserveAspectFit


    }

    Rectangle {
        id: progressBarBackground
        y: 585
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenterOffset: -1
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
        text: "Loading" + dots
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: progressBarBackground.top
        anchors.bottomMargin: 10
        font.weight: Font.ExtraBold
        font.pointSize: 28
        color: "#000000"
    }

    Timer {
        id: dotTimer
        interval: 500 // 500 ms for smooth dot animation
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
        interval: 50 // Update progress every 50 ms
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
        // Change colors based on progress
        if (progress < 33) {
            progressColor = "#24a5fb";
        } else if (progress < 66) {
            progressColor = "#e711ff";
        } else {
            progressColor = "#ff770e";
        }
    }
}
