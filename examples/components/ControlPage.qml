import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import RinUI

FluentPage {
    id: fluentPage

    property url docsUrl: "https://ui.rinlit.cn/"

    contentSpacing: 32

    header: Item {
        id: container
        height: headerRow.height + 44

        ColumnLayout {
            id: headerRow
            width: Math.min(fluentPage.width - fluentPage.horizontalPadding * 2, fluentPage.wrapperWidth)  // 限制最大宽度
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 12
            anchors.bottom: parent.bottom

            Text {
                height: parent.height
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                typography: Typography.Title
                text: fluentPage.title
                visible: fluentPage.title !== ""  // 标题
            }

            // 拓展区域 //
            RowLayout {
                Button {
                    icon.name: "ic_fluent_document_20_regular"
                    text: qsTr("Documentation")
                    onClicked: docsMenu.open()
                    Menu {
                        id: docsMenu
                        MenuItem {
                            text: fluentPage.title + " - " + qsTr("Rin UI Documentation")
                            onClicked: Qt.openUrlExternally(docsUrl)
                        }
                    }
                }
                Button {
                    icon.name: "ic_fluent_code_20_regular"
                    text: qsTr("Source")
                }

                Item {
                    Layout.fillWidth: true
                }

                spacing: 4
                ToolButton {
                    icon.name: "ic_fluent_brightness_high_20_filled"
                    ToolTip {
                        delay: 500
                        text: qsTr("Toggle theme")
                        visible: parent.hovered
                    }
                    onClicked: {
                        console.log(Theme.currentTheme.isDark)
                        if (Theme.currentTheme.isDark) {
                            Theme.setTheme("Light")
                        } else {
                            Theme.setTheme("Dark")
                        }
                    }
                }

                ToolSeparator { }

                ToolButton {
                    icon.name: "ic_fluent_person_feedback_20_regular"
                    onClicked: Qt.openUrlExternally("https://github.com/RinLit-233-shiroko/Rin-UI/issues/new/choose")

                    ToolTip {
                        delay: 500
                        text: qsTr("Send feedback")
                        visible: parent.hovered
                    }
                }
            }
        }
    }
}
