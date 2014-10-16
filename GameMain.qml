import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 450
    height: 800
    title: qsTr("UllApp")
    color: "#ffffff"

    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})

    Item {
        id: mainArea
        anchors.fill: parent
        x: 0
        y: 0
        state: "gameMenu"

        states: [
            State {
                name: "gameMenu"
            },
            State {
                name: "inGame"
            },
            State {
                name: "doneGame"
            },
            State {
                name: "infoGame"
            }
        ]

        Game {
            id: game
            anchors.fill: parent
            visible: parent.state === "inGame"
        }
        GameInfo {
            id: gameinfo
            anchors.fill: parent
            visible: parent.state === "infoGame"
        }
        GameFinished {
            id: gamefinished
            anchors.fill: parent
            visible: parent.state === "doneGame"
        }
        GameStart {
            id: gamestart
            anchors.fill: parent
            visible: parent.state === "gameMenu"
        }


    }
}
