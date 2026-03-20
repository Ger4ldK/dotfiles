pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string time
    property string date

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
        command: ['date','+%a, %b %d %Y']
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
