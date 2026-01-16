import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

// Container for all workspaces
ClippingRectangle {
  
  // Wrapper for ...??? not sure
  Item {
    anchors.fill: parent

    // Layout for all workspaces
    ColumnLayout {
      id: layout

      anchors.centerIn: parent
      
      // Loop to generate all workspace components
      Repeater {
        id: workspaces

        model: 5

        Workspace {
          
        }

      }
    }
  }
}

