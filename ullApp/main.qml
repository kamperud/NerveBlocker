import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 640
    height: 480
    title: qsTr("UllApp")
    color: "#ffffff"

    //only creates a menuBar if system is not iOS. Returns null in that case
    menuBar: Qt.createComponent(sys.isIos ? "" : "AndroidMenu.qml").createObject(applicationWindow1,{})

    Item {
        id: mainArea
        anchors.fill: parent
        state: "mainMenu"
        states: [
            State {
                name: "mainMenu"
            },
            State {
                name: "gameMenu"
            },
            State {
                name: "archiveMenu"
            }
        ]
        focus: true // important - otherwise we'll get no key events

       Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               mainArea.state = "mainMenu"
           }
       }

        ListView {
            id: mainMenu
            x: 0
            y: 240
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left
            visible: mainArea.state === "mainMenu"

            MenuButton {
                id: gameButton
                text: qsTr("GAME")
                anchors.bottom: parent.top
                onClicked: mainArea.state = "gameMenu"
            }

            MenuButton {
                id: archiveButton
                text: qsTr("ARCHIVE")
                anchors.top: gameButton.bottom
                onClicked: mainArea.state = "archiveMenu"
            }
        }

        ListView {
            id: gameMenu
            x: 0
            y: 240
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left
            visible: mainArea.state === "gameMenu"

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
            x: 0
            y: 240
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left
            visible: mainArea.state === "archiveMenu"

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

