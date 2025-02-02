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
    minimumWidth: Constants.width
    minimumHeight: Constants.height

    StackView {
        id: stackView
        visible: true
        anchors.fill: parent
        initialItem: "views/MainView.ui.qml"
    }
}
