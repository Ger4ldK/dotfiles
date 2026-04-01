import QtQuick
import QtQuick.Layouts
import "../Singletons/" as Singletons

RowLayout {
    height: parent.height
    spacing: 4

    TextNode {
        id: memUsage
        fontSize: Singletons.Constants.smallFontSize
        text: Singletons.Memory.mem
    }
}
