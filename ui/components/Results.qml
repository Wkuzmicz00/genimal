import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 722
    height: 484
    color: "#b53f51b1"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#d23f51b1"
        }

        GradientStop {
            position: 0.13
            color: "#cf5a55ae"
        }

        GradientStop {
            position: 0.25
            color: "#cd7b5fac"
        }

        GradientStop {
            position: 0.38
            color: "#cf8f6aae"
        }

        GradientStop {
            position: 0.5
            color: "#c7a86aa4"
        }

        GradientStop {
            position: 0.62
            color: "#c4cc6b8e"
        }

        GradientStop {
            position: 0.75
            color: "#c7f18271"
        }

        GradientStop {
            position: 0.87
            color: "#c7f3a469"
        }

        GradientStop {
            position: 1
            color: "#c9f7c978"
        }
        orientation: Gradient.Vertical
    }

    property string jsonString
    property var jsonArray: []
    property bool loadingComplete: false
    property bool dataLoaded: false
    property bool progressCompleted: false
    property real animatedPercent: 0
    property real totalPercent: 0
    property real speedFactor: 1
    property bool percentCompleted: false

    function loadJsonToArray(jsonString) {
        jsonArray = JSON.parse(jsonString);
        totalPercent = parseFloat(jsonArray[0].percent);
        dataLoaded = true;
    }

    //Timer {
    //    interval: 1000
    //    running: true
    //    repeat: false
    //    onTriggered: loadJsonToArray()
    //}

    Image {
        source: jsonArray[0].image_path
        height: 309
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 155
        anchors.rightMargin: 155
        anchors.topMargin: 8
        fillMode: Image.PreserveAspectFit
        opacity: dataLoaded && progressCompleted ? 1 : 0
        visible: dataLoaded && progressCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }

    Text {
        x: 234
        width: 254
        height: 34
        text: "1. " + jsonArray[0].name
        anchors.top: parent.top
        anchors.topMargin: 317
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "white"
        opacity: dataLoaded && progressCompleted ? 1 : 0
        visible: dataLoaded && progressCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Text {
        x: 135
        width: 182
        height: 34
        text: "Similarity:"
        anchors.top: parent.top
        anchors.topMargin: 360
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        color: "white"
        opacity: dataLoaded && progressCompleted ? 1 : 0
        visible: dataLoaded && progressCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }

    Text {
        x: 333
        width: 80
        height: 40
        text: Math.round(animatedPercent) + "%"
        anchors.top: parent.top
        anchors.topMargin: 360
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "white"
        opacity: dataLoaded && progressCompleted ? 1 : 0
        visible: dataLoaded && progressCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }

    Timer {
        id: updatePercent
        interval: 50
        running: dataLoaded && progressCompleted
        repeat: true
        onTriggered: {
            let step = totalPercent / 100;
            if (animatedPercent < totalPercent) {
                if (animatedPercent < totalPercent * 0.5) {
                    speedFactor = 4;
                    animatedPercent += step * speedFactor;
                } else if (animatedPercent < totalPercent * 0.8) {
                    speedFactor = 3;
                    animatedPercent += step * speedFactor;
                } else if (animatedPercent < totalPercent * 0.95) {
                    speedFactor = 0.5;
                    animatedPercent += step * speedFactor;
                } else {
                    speedFactor = 0.2;
                    animatedPercent += step * speedFactor;
                }
            } else {
                animatedPercent = totalPercent;
                updatePercent.stop();

                delayCompletion.start();
            }
        }
    }

    Timer {
        id: delayCompletion
        interval: 500
        running: false
        repeat: false
        onTriggered: {
            percentCompleted = true;
        }
    }
    Text {
            x: 513
            width: 254
            height: 34
            text: "2. " + jsonArray[1].name + " " + jsonArray[1].percent + "%"
            anchors.top: parent.top
            anchors.topMargin: 363
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            color: "white"
            opacity: dataLoaded && percentCompleted ? 1 : 1
            visible: dataLoaded && percentCompleted
            Behavior on opacity {
                NumberAnimation {
                    duration: 800
                    easing.type: Easing.InOutQuad
                }
            }
        }
    Text {
        x: 513
        width: 254
        height: 34
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        color: "white"
        text: "3. " +jsonArray[2].name + " " + jsonArray[2].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 393
        opacity: dataLoaded && percentCompleted ? 1 : 1
        visible: dataLoaded && percentCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Text {
        x: 513
        width: 254
        height: 34
        text: "4. " + jsonArray[3].name + " " + jsonArray[3].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 423
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        color: "white"
        opacity: dataLoaded && percentCompleted ? 1 : 1
        visible: dataLoaded && percentCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Text {
        x: 513
        width: 254
        height: 34
        text: "5. " + jsonArray[4].name + " " + jsonArray[4].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 453
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        font.bold: false
        color: "white"
        opacity: dataLoaded && percentCompleted ? 1 : 1
        visible: dataLoaded && percentCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Rectangle {
        id: loadingOverlay
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "black"
        visible: !loadingComplete
        z: 10



        Column {
            anchors.centerIn: parent
            spacing: 20

            Rectangle {
                id: progressBar
                width: 300
                height: 20
                radius: 10
                color: "transparent"
                border.width: 3
                border.color: "white"

                Rectangle {
                    id: progress
                    x: 3
                    width: 0
                    color: "#b6df89b5"
                    radius: 10
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 3
                    anchors.bottomMargin: 3

                    Behavior on width {
                        NumberAnimation {
                            duration: 80
                        }
                    }
                }
            }
        }

        Timer {
            interval: 30
            running: true
            repeat: true
            onTriggered: {
                if (progress.width < 297) {
                    progress.width += progressBar.width / 40;
                } else {
                    loadingOverlay.visible = false;
                    loadingComplete = true;
                    progressCompleted = true;
                }
            }
        }

        Text {
            id: _text1
            x: 221
            y: 200
            width: 65
            height: 26
            color: "#ffffff"
            text: "mmm..."
            font.pixelSize: 20
            font.styleName: "Semilight Italic"
            font.bold: true
            opacity: progress.width >= 1 ? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }

        }
        Text {
            id: _text2
            x: 292
            y: 200
            width: 65
            height: 26
            color: "#ffffff"
            text: "I see..."
            font.pixelSize: 20
            font.styleName: "Semilight Italic"
            font.bold: true
            opacity: progress.width >= 100 ? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }
        Text {
            id: _text3
            x: 355
            y: 200
            width: 71
            height: 26
            color: "#ffffff"
            text: "you are..."
            font.pixelSize: 20
            font.styleName: "Semilight Italic"
            font.bold: true
            opacity: progress.width >= 200 ? 1 : 0
            Behavior on opacity {
                NumberAnimation {
                    duration: 300
                }
            }
        }

    }
    Image {
        id: group4
        x: 439
        y: 381
        width: 74
        height: 111
        source: "../assets/images/Group (4).png"
        rotation: 74.738
        fillMode: Image.PreserveAspectFit
        opacity: dataLoaded && percentCompleted ? 1 : 1
        visible: dataLoaded && percentCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Text {
        x: 408
        y: 420
        width: 162
        height: 28
        text: "Check the other"
        font.pixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        rotation: -5.718
        font.italic: true
        font.bold: false
        color: "white"
        opacity: dataLoaded && percentCompleted ? 1 : 1
        visible: dataLoaded && percentCompleted
        Behavior on opacity {
            NumberAnimation {
                duration: 800
                easing.type: Easing.InOutQuad
            }
        }
    }
    Connections {
        target: controller
        function onResultReady(result)  {
            loadJsonToArray(result)
        }
    }
}
