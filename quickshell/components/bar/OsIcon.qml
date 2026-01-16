import QtQuick

Item {
    id: root

    // MouseArea {
    //     anchors.fill: parent
    //     cursorShape: Qt.PointingHandCursor
    //     onClicked: {
    //         const visibilities = Visibilities.getForActive();
    //         visibilities.launcher = !visibilities.launcher;
    //     }
    // }

    // ColouredIcon {
    //     anchors.centerIn: parent
    //     source: SysInfo.osLogo
    //     implicitSize: Appearance.font.size.large * 1.2
    //     colour: Colours.palette.m3tertiary
    // }
    
    Image {
      id: osLogo
      anchors.fill: parent 
      source: "../../assets/icons/os/arch.svg"
    }

    // implicitHeight: 10
    // implicitWidth: 10
    // implicitWidth: Appearance.font.size.large * 1.2
    // implicitHeight: Appearance.font.size.large * 1.2
}
