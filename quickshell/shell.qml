import Quickshell // for PanelWindow
import QtQuick // for Text

import "modules/background"
import "modules/drawer"
import "modules/bar"

ShellRoot {
  // Components are created in order of laying
  // For example, background is first so it goes behind everything
  // Lock screen will be last as it will cover everything
  Background {}
  BarStandalone {}
  // Drawer {}
  // LockScreen {}
}

