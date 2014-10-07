import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1


ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 450
    height: 800
    title: qsTr("UllApp")
    color: "#ffffff"

    //menuBar for !iOS
    //toolbar for iOS
    menuBar: Qt.createComponent(sys.isIos ? "" : "AndroidMenu.qml").createObject(applicationWindow1,{})
    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})

    //Hannas test bar
//    toolBar:Qt.createComponent("iOSMenu.qml").createObject(applicationWindow1, {})

    StackView {
        id: mainArea
        anchors.right: parent.right
        anchors.left: parent.left
        x: 0
        y: applicationWindow1.height/4
        initialItem: mainMenu
        focus: true // important - otherwise we'll get no key events

        Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               mainArea.pop()
               mainArea.y = applicationWindow1.height/4
           }
        }

        delegate: StackViewDelegate {
            pushTransition: StackViewTransition {
                // when this is empty, transitions don't appear
            }
        }

        ListView {
            id: mainMenu
            visible: false
            anchors.top: parent.top

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
            anchors.top: parent.top

            MenuButton {
                id: playButton
                text: qsTr("PLAY")
                visible: true
                anchors.bottom: parent.top
                onClicked: {
                    mainArea.push({
                        item: Qt.createComponent("Game.qml").createObject(applicationWindow1, {}),
                        destroyOnPop: true
                    })
                    mainArea.y = 0
                }
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
            anchors.top: parent.top

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

