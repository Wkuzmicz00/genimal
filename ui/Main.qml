// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls 2.15

import qmlFiles

Window {
    width: 1920
    height: 1080

    visible: true
    title: "GENIMAL"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "views/MainView.ui.qml" // Startowy ekran
    }

}

