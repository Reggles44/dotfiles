import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

import "root:/config"
import "root:/components"

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        // Main UI
        StyledWindow {
            id: root
            name: "sidebar"

            anchors.top: true
            anchors.bottom: true
            anchors.left: true

            // TODO: fix magic number
            implicitWidth: 30
            color: "#ffffff"

            Bar {
                width: root.contentWidth
                screen: scope.modelData
            }
            // Text { text: "text" }

            // BarWrapper {
            //     id: bar
            //     screen: scope.modelData
            // }
        }
    }
}
