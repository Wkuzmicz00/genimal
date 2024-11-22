import QtQuick
import QtQuick.Controls
import GenimalUi 1.0
import QtQuick.Dialogs
import QtQuick.Studio.DesignEffects

Item {
    id: imageUploader
    width: 400
    height: 500

    // Tło dla komponentu
    Rectangle {
        anchors.fill: parent
        color: "#808080"
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
        width: parent.width * 0.8
        height: parent.height * 0.6
        fillMode: Image.PreserveAspectFit
        source: "" // Na początku puste

    }

    // Przycisk do wgrywania zdjęcia
    Button {
        id: uploadButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        font.pointSize: 8
        text: "WGRAJ FOCIE"
        onClicked: fileDialog.open()

        DesignEffect {
            effects: [
                DesignDropShadow {
                }
            ]
        }
    }

    // Dialog wyboru pliku
    FileDialog {
        id: fileDialog
        title: "Wybierz zdjęcie"
        nameFilters: ["Obrazy (*.png *.jpg *.jpeg)"] // Obsługiwane formaty
        onAccepted: {
            if (fileDialog.currentFile) {
                userImage.source = fileDialog.currentFile // Przypisanie do obrazu
            } else {
                _text1.text = "Nie wybrano pliku"
            }
        }
        onRejected: {
            console.log("Wybór pliku anulowany")
        }
    }
}
