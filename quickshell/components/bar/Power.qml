import Quickshell
import QtQuick

import "root:/components"

Item {
    id: root

    TextIcon {
        id: icon

        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -1

        text: "⏻"
        // TODO: make config
        // color: Colours.palette.m3error
        font.bold: true
        // TODO: make config
        // font.pointSize: Appearance.font.size.normal
        font.pointSize: 15
    }
}
