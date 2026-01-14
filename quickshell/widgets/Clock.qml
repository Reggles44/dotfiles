import QtQuick

Text {
    id: clock
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm:ss")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm:ss")
    }
}

