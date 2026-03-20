import Quickshell
import QtQuick
    
Rectangle {
    color: Colors.background
    height: parent.height
    width: 220
    bottomLeftRadius: 10
    bottomRightRadius: 10

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right 
        anchors.rightMargin: 24
        id: dateText
        text: DateTime.date
        font.pointSize: 14
        color: Colors.foreground
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left 
        anchors.leftMargin: 24
        id: timeText
        text: DateTime.time
        font.pointSize: 18
        color: Colors.foreground
    }
}
