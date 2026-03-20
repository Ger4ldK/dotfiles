import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string time
    property string date

    Variants {
        model: Quickshell.screens;
        PanelWindow {
            required property var modelData
            screen: modelData
            
            implicitHeight: 30
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }


            Clock {
                anchors.centerIn: parent
                time: root.time
            }
        }
    }

    Process {
        id: timeProc
        command: ['date','+%H:%M']
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.time = this.text
        }
    }

    Process {
        id: dateProc
        command: ['date','+%a %b %d']
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.date = this.text
        }
    }

    Timer {
        interval: 20000
        running: true
        repeat: true
        onTriggered: timeProc.running = true
    }
}
