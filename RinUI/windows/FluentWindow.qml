import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components"
import "../windows"

FluentWindowBase {
    id: window
    visible: true
    title: qsTr("Fluent Window")
    width: 900
    height: 600
    minimumWidth: 400
    minimumHeight: 300
    titleEnabled: false
    titleBarHeight: Theme.currentTheme.appearance.windowTitleBarHeight

    property alias navigationItems: navigationView.navigationItems  // 导航栏item
    property alias defaultPage: navigationView.defaultPage  // 默认索引项
    property alias appLayerEnabled: navigationView.appLayerEnabled  // 应用层背景

    NavigationView {
        id: navigationView
        window: window
    }
}