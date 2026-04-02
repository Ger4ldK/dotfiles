import QtQuick
import "../Singletons/" as Singletons
    
Rectangle {
    color: Singletons.Colors.background
    border.color: Singletons.Colors.color2
    implicitHeight: parent.height
    implicitWidth: timeText.horizontalSize + dateText.horizontalSize
    radius: Singletons.Constants.radius

    Text {
        id: timeText
        property int horizontalSize
        horizontalSize: this.width + this.anchors.rightMargin + this.anchors.leftMargin 
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left 
        anchors.leftMargin: 24
        anchors.rightMargin: 22
        text: Singletons.DateTime.time
        font.pointSize: Singletons.Constants.bigFontSize
        color: Singletons.Colors.foreground
    }
    Text {
        id: dateText
        property int horizontalSize
        horizontalSize: this.width + this.anchors.rightMargin + this.anchors.leftMargin 
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right 
        anchors.rightMargin: 24
        text: Singletons.DateTime.date
        font.pointSize: Singletons.Constants.fontSize
        color: Singletons.Colors.foreground
    }
}

