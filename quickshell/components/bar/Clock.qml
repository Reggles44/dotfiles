pragma ComponentBehavior: Bound

import qs.components
import qs.services
import qs.config
import QtQuick

import "root:/services"

Column {
    id: root
    // TODO: move to config
    // property color colour: Colours.palette.m3tertiary
    //
    // spacing: Appearance.spacing.small
    
    // Loader {
    //     anchors.horizontalCenter: parent.horizontalCenter
    //
    //     active: Config.bar.clock.showIcon
    //     visible: active
    //     asynchronous: true
    //
    //     sourceComponent: MaterialIcon {
    //         text: "calendar_month"
    //         color: root.colour
    //     }
    // }

    Text {
        id: text

        anchors.horizontalCenter: parent.horizontalCenter

        // TODO: what is this?
        // horizontalAlignment: StyledText.AlignHCenter
        text: Time.format("hh\nmm")

        // TODO: make these real
        // font.pointSize: Appearance.font.size.smaller
        // font.family: Appearance.font.family.mono
        // color: root.colour
    }
}
