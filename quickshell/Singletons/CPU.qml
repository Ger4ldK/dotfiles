pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string cpu
    property string cpuTemp
    property int lastCpuTotal
    property int lastCpuIdle

    Process {
        id: cpuProc
        command: ['sh', '-c', 'head -1 /proc/stat']
        stdout: StdioCollector {
            onStreamFinished: () => {
                const data = this.text
                const p = data.trim().split(/\s+/)
                const idle = parseInt(p[4]) + parseInt(p[5])
                const total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                const cpuUsage = Math.round(100 * (1 - (idle - root.lastCpuIdle) / (total - root.lastCpuTotal)))
                root.lastCpuTotal = total
                root.lastCpuIdle = idle
                root.cpu = cpuUsage.toString()
            }
        }
        Component.onCompleted: running = true
    }

    Process {
        id: cpuTempProc
        command: ['sh', '-c', 'sensors | grep -A 2 k10temp']
        stdout: StdioCollector {
            onStreamFinished: () => {
                const data = this.text
                const t = data.trim().split(/\n+/)
                const temp = t[2].trim().split(/\s+/)
                root.cpuTemp = temp[1]
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: () => {
            cpuProc.running = true
        }
    }
}
