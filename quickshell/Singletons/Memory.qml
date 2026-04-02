pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string mem

    Process {
        id: memProc
        command: ['sh', '-c', 'free -h --giga | grep Mem']
        stdout: StdioCollector {
            onStreamFinished: () => {
                const data = this.text
                const m = data.trim().split(/\s+/)
                const used = parseFloat(m[2])
                const total = parseFloat(m[1])
                const pct= used/total * 100
                root.mem = used.toFixed(1) + "/" + total + "GB (" + pct.toFixed(0) + "%)"
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: memProc.running = true
    }
}
