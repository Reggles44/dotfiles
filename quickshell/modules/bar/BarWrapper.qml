import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts


Item {
    id: root

    required property ShellScreen screen

    visible: true
    implicitWidth: 20

    Text { text: "123" }

    Loader {
        id: content

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        // anchors {
        //   top: parent.top
        //   bottom: parent.bottom
        //   right: parent.right
        // }

        active: true

        sourceComponent: Bar {
            implicitWidth: root.contentWidth
            screen: root.screen
        }
    }
}
