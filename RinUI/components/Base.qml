import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

Item {
    id: base
    implicitWidth: 100
    implicitHeight: 40

    // 公共属性 / Common Properties
    property color backgroundColor: Theme.currentTheme.colors.controlColor
    property color borderColor: Theme.currentTheme.colors.controlBorderColor
    property color textColor: Theme.currentTheme.colors.textColor
    property real borderTransparency: Theme.currentTheme.appearance.borderFactor
    property real controlRadius: Theme.currentTheme.appearance.buttonRadius

    // 启用 MouseArea / Enable MouseArea
    property bool interactive: false

    // 主题切换 / Theme Switching
    Connections {
        target: Theme
        onCurrentThemeChanged: updateStyle()
    }

    function updateStyle() {
        backgroundColor = Theme.currentTheme.colors.controlColor
        borderColor = Theme.currentTheme.colors.controlBorderColor
        textColor = Theme.currentTheme.colors.textColor
        controlRadius = Theme.currentTheme.appearance.buttonRadius
        borderTransparency = Theme.currentTheme.appearance.borderTransparency
    }

    // 颜色动画 / Color Animation
    Behavior on backgroundColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on textColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on borderColor { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }

    // 背景 / Background
    Rectangle {
        id: border
        anchors.fill: parent
        radius: controlRadius
        gradient: Gradient {
            GradientStop { position: 0.91; color: backgroundColor.lighter(borderTransparency) }
            GradientStop { position: 1; color: backgroundColor.darker(1.4) }
        }

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.margins: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
            color: backgroundColor
            radius: controlRadius
        }
    }

    // 交互 / Interaction
    MouseArea {
        id: mouseArea
        visible: interactive
        anchors.fill: parent
        hoverEnabled: true
        onClicked: base.clicked()
    }

    signal clicked()
}