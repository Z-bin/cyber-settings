import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import MeuiKit 1.0 as Meui

Item {
    id: control

    height: mainLayout.implicitHeight + Meui.Theme.smallRadius * 2

    property alias key: keyLabel.text
    property alias value: valueLabel.text

    Layout.fillWidth: true

    Rectangle {
        id: background
        anchors.fill: parent
        color: Meui.Theme.viewBackgroundColor
        radius: Meui.Theme.smallRadius
    }

    RowLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.leftMargin: Meui.Units.largeSpacing
        anchors.rightMargin: Meui.Units.largeSpacing

        Label {
            id: keyLabel
        }

        Item {
            Layout.fillWidth: true
        }

        Label {
            id: valueLabel
        }
    }
}