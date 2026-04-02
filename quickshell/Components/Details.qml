import QtQuick
import QtQuick.Layouts
import "../Singletons/" as Singletons

RowLayout {
    height: parent.height
    spacing: 4

    DetailNode {
        id: cpuUsage
        fontSize: Singletons.Constants.smallFontSize
        text: Singletons.CPU.cpu + "% (" + Singletons.CPU.cpuTemp + ")"
        icon: "󰻠"
        iconColor: Singletons.Colors.color5
    }

    DetailNode {
        id: memUsage
        fontSize: Singletons.Constants.smallFontSize
        text: Singletons.Memory.mem
        icon: ""
        iconColor: Singletons.Colors.color1
    }
}
