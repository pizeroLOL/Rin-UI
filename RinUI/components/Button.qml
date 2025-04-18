import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components"

Button {
    id: root
    property color primaryColor: Theme.currentTheme.colors.primaryColor
    property color backgroundColor: flat ? Theme.currentTheme.colors.subtleSecondaryColor :
        highlighted ? primaryColor : Theme.currentTheme.colors.controlColor
    // default property alias icon.source: icon.source

    // accessibility
    FocusIndicator {
        control: parent
    }

    padding: 6
    topPadding: 5
    bottomPadding: 7

    background: Rectangle {
        id: border
        anchors.fill: parent
        radius: Theme.currentTheme.appearance.buttonRadius
        layer.enabled: true  // 单独渲染
        gradient: Gradient {
            GradientStop {
                position: 0.91;
                color: background.color.lighter(
                    enabled ? highlighted ? flat ? "transparent" :
                        Theme.currentTheme.appearance.borderOnAccentFactor :
                        Theme.currentTheme.appearance.borderFactor :
                        Theme.currentTheme.appearance.borderFactor
                )
            }
            GradientStop {
                position: 1;
                color: flat ? "transparent" : background.color.darker(1.4)
            }
        }

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.margins: Theme.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
            color: backgroundColor
            radius: border.radius
            Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        }

        opacity: flat && !hovered ? 0 : 1
    }

    implicitWidth: Math.max(iconWidget.width + text.width + 24, 88)
    implicitHeight: Math.max(text.height + 12, 32)

    contentItem: Item {
        anchors.fill: parent

        Row {
            spacing: 8
            anchors.centerIn: parent
            IconWidget {
                id: iconWidget
                size: icon || source ? text.font.pixelSize * 1.25 : 0  // 图标大小 / Icon Size
                icon: root.icon.name
                source: root.icon.source
                color: highlighted ? flat ?
                    enabled ? Theme.currentTheme.colors.textAccentColor : Theme.currentTheme.colors.textColor :
                    Theme.currentTheme.colors.textOnAccentColor : Theme.currentTheme.colors.textColor
            }
            Text {
                id: text
                typography: Typography.Body
                text: root.text
                color: highlighted ? flat ? Theme.currentTheme.colors.textAccentColor :
                    Theme.currentTheme.colors.textOnAccentColor : Theme.currentTheme.colors.textColor
            }
        }
    }

    Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.4
                backgroundColor: highlighted ? Theme.currentTheme.colors.disabledColor : Theme.currentTheme.colors.controlColor
            }
            PropertyChanges {
                target: border
                visible: !flat
            }
            PropertyChanges {
                target: text
                color: flat ? Theme.currentTheme.colors.disabledColor : text.color
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: root;
                opacity: 0.65
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: root;
                opacity: 0.875
            }
        }
    ]
}