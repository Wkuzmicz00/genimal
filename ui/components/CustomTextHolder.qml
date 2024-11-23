import QtQuick 2.15
import QtQuick.Controls 2.15

import qmlFiles

Rectangle {
    id: textAreaHolder
    x: 0
    y: 0
    width: 685
    height: 474
    color: "#000000"
    border.color: "gray"
    border.width: 3

    // Ustawienie limitu znaków
    property int charLimit: 200  // Limit znaków, np. 100 znaków

    TextArea {
        id: textArea
        x: 0
        y: 0
        width: 685
        height: 474
        font.pixelSize: 20
        placeholderTextColor: "#88707377"
        color: "white"
        placeholderText: "Kliknij, aby wpisać tekst"
        padding: 10

        wrapMode: TextArea.Wrap

        // Monitorowanie zmian tekstu
        onTextChanged: {
            // Sprawdzamy, czy liczba znaków przekroczyła limit
            if (text.length > charLimit) {
                // Jeśli liczba znaków przekroczyła limit, obcinamy tekst
                text = text.slice(0, charLimit);  // Ograniczamy tekst do limitu znaków
            }
        }

        Keys.onPressed: {
            // Jeśli liczba znaków przekroczyła limit, blokujemy dalsze pisanie
            if (text.length >= charLimit) {
                // Pozwalamy na usuwanie tekstu (Backspace i Delete)
                if (event.key === Qt.Key_Backspace || event.key === Qt.Key_Delete) {
                    event.accepted = false; // Akceptujemy usuwanie tekstu
                }
                // Zatrzymujemy wprowadzanie nowych znaków (spacji i Enter)
                else if (event.key === Qt.Key_Space || event.key === Qt.Key_Return || event.text.length > 0) {
                    event.accepted = true; // Zatrzymujemy dalsze pisanie nowych znaków
                }
            }
        }
    }
}
