pragma ComponentBehavior: Bound

// import qs.components.containers
// import qs.config
import Quickshell
import QtQuick

import "root:/components"

Scope {
    id: root

    required property ShellScreen screen
    required property Item bar

    // Bar ExclusionZone
    ExclusionZone {
        anchors.left: true
        exclusiveZone: root.bar.exclusiveZone
    }

    ExclusionZone {
        anchors.top: true
    }

    ExclusionZone {
        anchors.right: true
    }

    ExclusionZone {
        anchors.bottom: true
    }

    component ExclusionZone: StyledWindow {
        screen: root.screen
        name: "border-exclusion"
        // exclusiveZone: Config.border.thickness
        exclusiveZone: 10
        mask: Region {}
        implicitWidth: 1
        implicitHeight: 1
    }
}
