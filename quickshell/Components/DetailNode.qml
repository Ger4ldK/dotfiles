import QtQuick
import "../Singletons/" as Singletons

Rectangle {
    id: root
    required property string icon
    required property string iconColor
    required property string text
    required property int fontSize

    color: Singletons.Colors.background
    border.color: Singletons.Colors.color2

    implicitHeight: parent.height
    implicitWidth: textItem.horizontalSize + iconItem.horizontalSize
    radius: Singletons.Constants.radius

    Text {
        id: iconItem
        property int horizontalSize
        horizontalSize: this.width + this.anchors.leftMargin + this.anchors.rightMargin
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        color: root.iconColor

        text: root.icon
        font.pointSize: root.fontSize
    }

    Text {
        id: textItem
        property int horizontalSize
        horizontalSize: this.width + this.anchors.rightMargin
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        color: Singletons.Colors.foreground

        text: root.text
        font.pointSize: root.fontSize
    }
}

