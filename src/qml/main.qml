import QtQuick 2.4
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import MeuiKit 1.0 as Meui

ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: qsTr("Settings")
    id: rootWindow

    minimumWidth: 900
    minimumHeight: 600

    background: Rectangle {
        color: Meui.Theme.backgroundColor

        Behavior on color {
            ColorAnimation {
                duration: 250
            }
        }
    }

    RowLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillHeight: true
            width: 260
            color: Meui.Theme.viewBackgroundColor
            radius: 4

            SideBar {
                id: sideBar
                anchors.fill: parent

                onCurrentIndexChanged: {
                    switchPageFromIndex(currentIndex)
                }
            }
        }

        StackView {
            id: stackView
            Layout.fillWidth: true
            Layout.fillHeight: true
            initialItem: Qt.resolvedUrl(sideBar.model.get(0).page)
            clip: true

            pushEnter: Transition {}
            pushExit: Transition {}

            Rectangle {
                anchors.fill: parent
                color: Meui.Theme.backgroundColor

                Behavior on color {
                    ColorAnimation {
                        duration: 250
                    }
                }
            }
        }
    }

    function switchPageFromIndex(index) {
        stackView.push(Qt.resolvedUrl(sideBar.model.get(index).page))
    }

    function switchPageFromName(pageName) {
        for (var i = 0; i < sideBar.model.count; ++i) {
            if (pageName === sideBar.model.get(i).name) {
                switchPageFromIndex(i)
                sideBar.view.currentIndex = i

                // If the window is minimized, it needs to be displayed agin.
                rootWindow.show()
                rootWindow.raise()
            }
        }
    }
}
