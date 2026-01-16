pragma ComponentBehavior: Bound

import QtQuick

import "root:/components"
import "root:/services"

Item {
    id: root

    // required property int maxHeight

    clip: true
    // implicitWidth: Math.max(icon.implicitWidth, current.implicitHeight)
    // implicitHeight: icon.implicitHeight + current.implicitWidth + current.anchors.topMargin

    Text {
        id: text

        // anchors.horizontalCenter: icon.horizontalCenter
        // anchors.top: icon.bottom
        // anchors.topMargin: Appearance.spacing.small

        // font.pointSize: metrics.font.pointSize
        // font.family: metrics.font.family
        // color: root.colour
        // opacity: root.current === this ? 1 : 0

        transform: [
            // Translate {
            //     x: Config.bar.activeWindow.inverted ? -implicitWidth + text.implicitHeight : 0
            // },
            Rotation {
                angle: 90
                origin.x: text.implicitHeight / 2
                origin.y: text.implicitHeight / 2
            }
        ]

        width: implicitHeight
        height: implicitWidth

        // text: "hello world"
        text: Hypr.activeToplevel?.title ?? qsTr("Desktop")
    }

}
