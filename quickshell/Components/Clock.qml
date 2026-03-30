import Quickshell
import QtQuick
import "../Singletons/" as Singletons
    
Rectangle {
    color: Singletons.Colors.background
    height: parent.height
    width: 280
    topLeftRadius: Singletons.Constants.radius
    topRightRadius: Singletons.Constants.radius
    bottomLeftRadius: Singletons.Constants.radius
    bottomRightRadius: Singletons.Constants.radius

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right 
        anchors.rightMargin: Singletons.Constants.clockMargin
        id: dateText
        text: Singletons.DateTime.date
        font.pointSize: Singletons.Constants.fontSize
        color: Singletons.Colors.foreground
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left 
        anchors.leftMargin: Singletons.Constants.clockMargin
        id: timeText
        text: Singletons.DateTime.time
        font.pointSize: Singletons.Constants.bigFontSize
        color: Singletons.Colors.foreground
    }
}
