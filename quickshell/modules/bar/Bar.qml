import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "root:/widgets"
import "root:/widgets/hyprland"

import "root:/components"
import "root:/components/bar"


ColumnLayout {
    id: root

    required property ShellScreen screen

    // Fill parent with ColumnLayout
    anchors.fill: parent

    // This need to be here to properly attach layout settings
    component WrappedLoader: Loader {
        required property string name

        Layout.alignment: Qt.AlignHCenter
        visible: active
    }

    component Spacer: WrappedLoader { 
        name: "spacer"
        Layout.fillHeight: enabled 
    } 


    WrappedLoader {
        name: "os_icon"
        // TODO: Move this to config
        Layout.topMargin: 5
        sourceComponent: OsIcon {
            // TODO: Move this to config
            implicitWidth: 20
            implicitHeight: 20
        }
    }

    WrappedLoader {
        name: "workspaces"
        sourceComponent: Workspaces {
            // TODO: Move this to config
            implicitWidth: 20
            implicitHeight: 150
            color: "#100000"
            radius: 10
        }
    }

    // Spacer
    Spacer {}
    // Spacer

    WrappedLoader {
        name: "active_window"
        Layout.bottomMargin: 5
        sourceComponent: ActiveWindow {
            implicitWidth: 20
            implicitHeight: 150
        }
    }

    // Spacer
    Spacer {}
    // Spacer

    WrappedLoader {
      name: "clock"
      sourceComponent: Clock {}
    }

    WrappedLoader {
      name: "status_icon"
      sourceComponent: StatusIcons {}
    }

    WrappedLoader {
      name: "power"
      Layout.bottomMargin: 13
      sourceComponent: Power {}
    }
}
