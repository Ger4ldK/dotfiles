import Quickshell
import QtQuick
    
Rectangle {
    color: Colors.background
    height: parent.height
    width: 260
    bottomLeftRadius: Constants.radius
    bottomRightRadius: Constants.radius

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right 
        anchors.rightMargin: Constants.clockMargin
        id: dateText
        text: DateTime.date
        font.pointSize: Constants.fontSize
        color: Colors.foreground
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left 
        anchors.leftMargin: Constants.clockMargin
        id: timeText
        text: DateTime.time
        font.pointSize: Constants.bigFontSize
        color: Colors.foreground
    }
}
