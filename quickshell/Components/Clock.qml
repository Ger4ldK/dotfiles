import QtQuick
import "../Singletons/" as Singletons
    
Rectangle {
    color: Singletons.Colors.background
    border.color: Singletons.Colors.color2
    implicitHeight: parent.height
    implicitWidth: timeText.width + dateText.width + 70
    radius: Singletons.Constants.radius

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left 
        anchors.leftMargin: Singletons.Constants.clockMargin
        id: timeText
        text: Singletons.DateTime.time
        font.pointSize: Singletons.Constants.bigFontSize
        color: Singletons.Colors.foreground
    }
    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right 
        anchors.rightMargin: Singletons.Constants.clockMargin
        id: dateText
        text: Singletons.DateTime.date
        font.pointSize: Singletons.Constants.fontSize
        color: Singletons.Colors.foreground
    }
}
