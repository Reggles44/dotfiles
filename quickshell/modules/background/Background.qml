import Quickshell
import QtQuick
import Quickshell.Wayland

import "root:/components"

Loader {
    asynchronous: true
    active: true // TODO: make a config values

    Variants {
        model: Quickshell.screens

        StyledWindow {
            id: win

            required property ShellScreen modelData

            screen: modelData
            name: "background"
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background

            anchors.top: true
            anchors.bottom: true
            anchors.left: true
            anchors.right: true

            Wallpaper {}
        }
    }
}
