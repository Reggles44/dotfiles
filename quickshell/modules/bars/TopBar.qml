import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "root:/widgets"
import "root:/widgets/hyprland"
import "root:/components"

PanelWindow {
    id: topBar

    color: "transparent"

    implicitHeight: 20

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
      top: 5
      left: 5
      right: 5
    }

    Rectangle {
      height: parent.height
      width: parent.width
      radius: 15

    }

    // Top Left
    Rectangle {
        id: container_left_rect
        height: parent.height

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        Row {
            id: container_left
            spacing: 10

            anchors {
              left: parent.left
              leftMargin: 20
              verticalCenter: parent.verticalCenter 
            }

            Text { text: "⌂" }
            Spacer {}
            Text { text: "Left" }
        }
    }

    // Middle
    Rectangle {
        id: container_center_rect
        height: parent.height
        width: implicitWidth
        color: "transparent"

        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        

        Row {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Workspaces {}
        }
    }

    // Right
    Rectangle {
        id: container_right_rect
        height: parent.height
        color: "transparent"

        anchors {
            left: container_center_rect.right
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        Row {
            id: container_right
            spacing: 10

            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            CPU {}
            Spacer {}
            Memory {}
            Spacer {}
            Clock {}
        }

    }
}
