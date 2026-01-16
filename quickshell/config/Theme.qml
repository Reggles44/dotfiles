pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: theme

    // Background
    property string background: "/home/r/dotfiles/background.jpg"

    // Colors
    component Colors: JsonObject {
      property string primary: "#82aaff"
    }

    // Fonts
    component FontFamily: JsonObject {
        property string sans: "Rubik"
        property string mono: "CaskaydiaCove NF"
        property string material: "Material Symbols Rounded"
        property string clock: "Rubik"
    }

    component FontSize: JsonObject {
        property real scale: 1
        property int small: 11 * scale
        property int smaller: 12 * scale
        property int normal: 13 * scale
        property int larger: 15 * scale
        property int large: 18 * scale
        property int extraLarge: 28 * scale
    }

    component FontStuff: JsonObject {
        property FontFamily family: FontFamily {}
        property FontSize size: FontSize {}
    }

}

