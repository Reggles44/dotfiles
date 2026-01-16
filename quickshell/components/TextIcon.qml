import QtQuick

Text {
    property real fill
    property int grade: Colours.light ? 0 : -25

    // TODO: make config
    // font.family: Appearance.font.family.material
    // font.pointSize: Appearance.font.size.larger
    font.variableAxes: ({
        FILL: fill.toFixed(1),
        GRAD: grade,
        // NOTE: What does this do
        // TODO: make config
        // opsz: fontInfo.pixelSize,
        // wght: fontInfo.weight
    })
}
