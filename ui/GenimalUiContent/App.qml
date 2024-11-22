// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import GenimalUi
import QtQuick.VirtualKeyboard
import QtQuick.Controls 2.15

Window {
    width: 1920
    height: 1080

    visible: true
    title: "GenimalUi"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Screen01.ui.qml" // Startowy ekran
    }

}

