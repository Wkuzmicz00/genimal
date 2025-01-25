// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls 2.15
import components
import qmlFiles

Window {
    id: mainWindow
    visible: true
    maximumWidth: Constants.width
    maximumHeight: Constants.height
    title: "GENIMAL"
    color: "transparent"
    flags: Qt.FramelessWindowHint
    minimumWidth: Constants.width
    minimumHeight: Constants.height

    SplashScreen {
        id: splashScreen
        visible: true

        Timer {
            id: splashTimer
            interval: 4750
            running: true
            repeat: false
            onTriggered: {
                fadeOutAnimation.start()
            }
        }
        PropertyAnimation {
            id: fadeOutAnimation
            target: splashScreen
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: 1000
            onStopped: {
                splashScreen.visible = false // Ukryj ekran powitalny
                stackView.visible = true // Pokaż StackView
                bounceAnimation.start() // Rozpocznij animację "bounce"
                }
            }
    }
    StackView {
        id: stackView
        visible: false
        opacity: 0.0
        anchors.fill: parent
        initialItem: "views/MainView.ui.qml"
        SequentialAnimation {
            id: bounceAnimation
            PropertyAnimation {
                target: stackView
                property: "y"
                from: -mainWindow.height // Przesuń z góry
                to: 0
                duration: 500
                easing.type: Easing.OutBounce
            }
            PropertyAnimation {
                target: stackView
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 500
            }
            ScriptAction {
                script: {
                mainWindow.flags = Qt.Window
                }
            }
        }
    }
}
