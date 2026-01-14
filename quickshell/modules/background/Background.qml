import Quickshell
import QtQuick
import Quickshell.Wayland


Scope {
    Variants {
        model: Quickshell.screens

        WlrLayershell {
            id: background
            required property var modelData
            screen: modelData
            layer: WlrLayer.Background

            visible: true
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            exclusiveZone: ExclusionMode.Ignore
            color: "transparent"

            Image {
                id: wallpaper
                height: parent.height
                width: parent.width

                anchors {
                  fill: parent
                  verticalCenter: parent.verticalCenter
                }

                source: "/home/r/Downloads/background.jpg"

            }
        }
    }
}
