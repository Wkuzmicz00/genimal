// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls 2.15
import components
import qmlFiles

Window {
    id: mainWindow
    visible: true
    width: 1920
    height: 1080
    title: "GENIMAL"
    color: "transparent"
    flags: Qt.FramelessWindowHint

    SplashScreen {
        id: splashScreen
        visible: true

        Timer {
            id: splashTimer
            interval: 5000 // 5 sekund
            running: true
            repeat: false
            onTriggered: {
                fadeOutAnimation.start() // Uruchomienie animacji zanikania
            }
        }

        // Animacja zanikania SplashScreen
        SequentialAnimation {
            id: fadeOutAnimation
            PropertyAnimation {
                target: splashScreen
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 500
            }
            ScriptAction {
                script: {
                    splashScreen.visible = false // Ukryj SplashScreen po animacji
                    stackView.visible = true    // Pokaż StackView
                    fadeInAnimation.start()    // Rozpocznij animację StackView
                    mainWindow.flags = Qt.Window // Przywróć ramkę okna
                }
            }
        }
    }

    StackView {
        id: stackView
        visible: false
        opacity: 0.0 // Ukryj widok na początku
        anchors.fill: parent
        initialItem: "views/MainView.ui.qml" // Startowy ekran

        // Animacja pojawiania się StackView
        PropertyAnimation {
            id: fadeInAnimation
            target: stackView
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 1000 // 1 sekunda
        }
    }
}
