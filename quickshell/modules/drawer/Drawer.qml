import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects

import "root:/config"
import "root:/components"

import "root:/modules/bar"

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        // TODO: does this actually do anything
        Exclusions {
            screen: scope.modelData
            bar: bar
        }

        // Main UI
        StyledWindow {
            name: "win"
            screen: scope.modelData

            // NOTE: Do not put this in a WlrLayershell as it will not effect the window
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            // NOTE: Anchor the window to the entire screen
            // TODO: this breaks everything...
            // anchors.top: true
            // anchors.bottom: true
            // anchors.left: true
            // anchors.right: true
            // anchors {
            //     top: true
            //     bottom: true
            //     left: true
            //     right: true
            // }

            // NOTE: Define region covering all 
            mask: Region {
                x: bar.implicitWidth + win.dragMaskPadding
                y: Config.border.thickness + win.dragMaskPadding
                width: win.width - bar.implicitWidth - Config.border.thickness - win.dragMaskPadding * 2
                height: win.height - Config.border.thickness * 2 - win.dragMaskPadding * 2
                intersection: Intersection.Xor

                regions: regions.instances
            }

            // NOTE: Create regions for all panel children
            Variants {
                id: regions

                model: panels.children

                Region {
                    required property Item modelData

                    x: modelData.x + bar.implicitWidth
                    y: modelData.y + Config.border.thickness
                    width: modelData.width
                    height: modelData.height
                    intersection: Intersection.Subtract
                }
            }

            // TODO: temp text
            Text { text: "Hello World" }

            // NOTE: Create our bar through the wrapper
            BarWrapper {
                id: bar

                anchors.top: parent.top
                anchors.bottom: parent.bottom

                screen: scope.modelData
            }
        }
    }
}
