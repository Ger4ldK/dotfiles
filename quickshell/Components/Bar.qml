import Quickshell

Scope {
    id: root

    Variants {
        model: Quickshell.screens;
        PanelWindow {
            required property var modelData
            screen: modelData
            
            implicitHeight: 36
            color: "transparent"

            margins {
                top: 4
                bottom: 4
                left: 4
                right: 4
            }
            anchors {
                top: true
                left: true
                right: true
            }

            Clock {
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Details {
                anchors.right: parent.right
            }
        }
    }
}
