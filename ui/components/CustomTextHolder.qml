import QtQuick 2.15
import QtQuick.Controls 2.15

import qmlFiles

Rectangle {
    id: textAreaHolder
    x: 0
    y: 0
    width: 700
    height: 430
    color: "transparent"
    border.color: "white"
    border.width: 3
    radius: 10

    // Ustawienie limitu znaków
    property int charLimit: 600  // Limit znaków, np. 100 znaków

    TextArea {
        id: textArea
        x: 0
        y: 0
        width: 700
        height: 430
        font.pixelSize: 20
        placeholderTextColor: "white"
        color: "white"
        placeholderText: "DESCRIBE YOURSELF"
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
