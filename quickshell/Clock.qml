import Quickshell
import QtQuick
    
Rectangle {
    color: Colors.background
    implicitHeight: 30
    implicitWidth: 100
    bottomLeftRadius: 10
    bottomRightRadius: 10

    Text {
        anchors.centerIn: parent
        id: clock
        text: DateTime.time
        font.pointSize: 14
        color: Colors.foreground
    }
}
