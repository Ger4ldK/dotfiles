import QtQuick
import "../Singletons/" as Singletons

Rectangle {
    id: root
    required property var text
    required property var fontSize

    color: Singletons.Colors.background
    border.color: Singletons.Colors.color2

    implicitHeight: parent.height
    implicitWidth: textItem.width + 16
    radius: Singletons.Constants.radius

    Text {
        id: textItem
        anchors.centerIn: parent
        color: Singletons.Colors.foreground

        text: root.text
        font.pointSize: root.fontSize
    }
}

