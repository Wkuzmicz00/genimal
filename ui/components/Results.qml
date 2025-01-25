import QtQuick
import QtQuick.Controls

Rectangle {
    id: root
    width: 750
    height: 500
    color: "transparent"
    border.color: "white"
    border.width: 3
    radius: 10

    property string jsonString
    property var jsonArray: []
    property bool loadingComplete: false
    property bool dataLoaded: false
    property bool progressCompleted: false
    property real animatedPercent: 0
    property real totalPercent: 0
    property real speedFactor: 1
    property bool percentCompleted: false

    function loadJsonToArray() {
        jsonString = '[ \
            { \
                "name": "MONKEY", \
                "image_path": "../assets/animal_images/monkey.png", \
                "percent": "85.5" \
            }, \
            { \
                "name": "DOG", \
                "image_path": "../assets/animal_images/dog.png", \
                "percent": "80" \
            }, \
            { \
                "name": "ELEPHANT", \
                "image_path": "../assets/animal_images/elephant.png", \
                "percent": "75.2" \
            }, \
            { \
                "name": "CAT OLGA", \
                "image_path": "../assets/animal_images/cat.png", \
                "percent": "69" \
            }, \
            { \
                "name": "SNAKE", \
                "image_path": "../assets/animal_images/snake.png", \
                "percent": "9.7" \
            } \
        ]';
        jsonArray = JSON.parse(jsonString);
        totalPercent = parseFloat(jsonArray[0].percent);
        dataLoaded = true;
    }

    Timer {
        interval: 1000
        running: true
        repeat: false
        onTriggered: loadJsonToArray()
    }

    Image {
        width: 382
        source: jsonArray[0].image_path
        height: 309
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 25
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
        x: 89
        width: 254
        height: 34
        text: jsonArray[0].name
        anchors.top: parent.top
        anchors.topMargin: 315
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        x: 8
        width: 182
        height: 34
        text: "Similarity:"
        anchors.top: parent.top
        anchors.topMargin: 358
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        x: 181
        width: 80
        height: 40
        text: Math.round(animatedPercent) + "%"
        anchors.top: parent.top
        anchors.topMargin: 355
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        x: 476
        width: 254
        height: 34
        text: jsonArray[1].name + " " + jsonArray[1].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 80
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        x: 476
        width: 254
        height: 34
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
        text: jsonArray[2].name + " " + jsonArray[2].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 160
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
        x: 476
        width: 254
        height: 34
        text: jsonArray[3].name + " " + jsonArray[3].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 240
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        x: 476
        width: 254
        height: 34
        text: jsonArray[4].name + " " + jsonArray[4].percent + "%"
        anchors.top: parent.top
        anchors.topMargin: 320
        font.pixelSize: 25
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        color: "black"
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
        width: parent.width
        height: parent.height
        color: "transparent"
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
                    height: 13
                    color: "#a0a86aa4"
                    radius: 10
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 1

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
                    loadJsonToArray();
                }
            }
        }
    }
}
