import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../themes"

TextField {
    id: root

    property real borderFactor: Theme.currentTheme.appearance.borderFactor

    // 背景 / Background //
    background: Rectangle {
        radius: 3
        color: Theme.currentTheme.color.controlColor
        // TODO: Border
        height: 32
        width: 160
    }

    leftPadding: 12
    // 删除按钮宽 28 右边距 2
    rightPadding: 34
    topPadding: 5
    bottomPadding: 5

    // 字体 / Font //
    font.pixelSize: Theme.currentTheme.typography.bodySize
    color: Theme.currentTheme.color.textColor
    placeholderTextColor: Theme.currentTheme.color.textSecondaryColor

    // 状态变化
    // states: [
    //     State {
    //     name: "disabled"
    //         when: !enabled
    //         PropertyChanges {  // 禁用时禁止改变属性
    //             target: root;
    //             opacity: 0.4
    //         }
    //     },
    //     State {
    //         name: "pressed"
    //         when: pressed
    //         PropertyChanges {
    //             target: root;
    //             opacity: 0.65
    //         }
    //     },
    //     State {
    //         name: "hovered"
    //         when: hovered
    //         PropertyChanges {
    //             target: root;
    //             opacity: 0.875
    //         }
    //     }
    // ]
    // Rectangle {
    //     // color: Theme.currentTheme.color.systemAttentionColor
    //     color: Qt.alpha("#000000", 0.0241)
    //     height: 2
    //     width: root.width
    //     anchors.bottom: root.bottom
    // }
}
