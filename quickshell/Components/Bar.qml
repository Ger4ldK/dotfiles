import Quickshell
import QtQuick

Scope {
    id: root

    Variants {
        model: Quickshell.screens;
        PanelWindow {
            required property var modelData
            screen: modelData
            
            height: 36
            color: "transparent"

            margins {
                top: 2
                bottom: 2
            }
            anchors {
                top: true
                left: true
                right: true
            }

            Clock {
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
