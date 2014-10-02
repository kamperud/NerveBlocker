import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1


ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 640
    height: 480
    title: qsTr("UllApp")
    color: "#ffffff"

    //only creates a menuBar if system is not iOS. Returns null in that case
    menuBar: Qt.createComponent(sys.isIos ? "" : "AndroidMenu.qml").createObject(applicationWindow1,{})

    //navbar for iOS
    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})

    StackView {
        id: mainArea
        x: 0
        y: applicationWindow1.height/4
        anchors.right: parent.right
        anchors.left: parent.left
        initialItem: mainMenu
        focus: true // important - otherwise we'll get no key events

       Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               mainArea.pop()
           }
       }

        ListView {
            id: mainMenu
            visible: false

            MenuButton {
                id: gameButton
                text: qsTr("GAME")
                anchors.bottom: parent.top
                onClicked: mainArea.push(gameMenu)
            }

            MenuButton {
                id: archiveButton
                text: qsTr("ARCHIVE")
                anchors.top: gameButton.bottom
                onClicked: mainArea.push(archiveMenu)
            }
        }

        ListView {
            id: gameMenu
            visible: false

            MenuButton {
                id: playButton
                text: qsTr("PLAY")
                visible: true
                anchors.bottom: parent.top
            }

            MenuButton {
                id: highScoreButton
                text: qsTr("HIGH SCORE")
                anchors.top: playButton.bottom
            }
        }

        ListView {
            id: archiveMenu
            visible: false


            MenuButton {
                id: armButton
                text: qsTr("ARM")
                visible: true
                anchors.bottom: parent.top
            }

            MenuButton {
                id: legButton
                text: qsTr("LEG")
                anchors.top: armButton.bottom
            }

        }

    }
}

