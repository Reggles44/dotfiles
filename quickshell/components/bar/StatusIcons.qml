pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

import "root:/components"

StyledRect {
    id: root


    clip: true
    // implicitWidth: Config.bar.sizes.innerWidth
    // implicitHeight: iconColumn.implicitHeight + Appearance.padding.normal * 2 - (Config.bar.status.showLockStatus && !Hypr.capsLock && !Hypr.numLock ? iconColumn.spacing : 0)

    ColumnLayout {
        id: iconColumn

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        // TODO: Make config value
        anchors.bottomMargin: 5

        // TODO: Make config value
        spacing: 3

        // This need to be here to properly attach layout settings
        component WrappedLoader: Loader {
            required property string name

            Layout.alignment: Qt.AlignHCenter
            visible: active
        }


        // Lock keys status
        WrappedLoader {
            name: "lockstatus"
        }

        // Audio icon
        WrappedLoader {
            name: "audio"
        }

        // Microphone icon
        WrappedLoader {
            name: "audio_microphone"
        }

        // Network icon
        WrappedLoader {
            name: "network"

            sourceComponent: Text {
              // text: Icons.getNetworkIcon(Nmcli.active.strength ?? 0)
              text: Nmcli.active.strength
            }
        }

        // Ethernet icon
        WrappedLoader {
            name: "ethernet"
            // active: Config.bar.status.showNetwork && Nmcli.activeEthernet
            //
            // sourceComponent: MaterialIcon {
            //     animate: true
            //     text: "cable"
            //     color: root.colour
            // }
        }

        // Bluetooth section
        WrappedLoader {
            name: "bluetooth"
            // active: Config.bar.status.showBluetooth

            Layout.preferredHeight: implicitHeight
        }

        // Battery icon
        WrappedLoader {
            name: "battery"
            // active: Config.bar.status.showBattery
        }
    }

}
