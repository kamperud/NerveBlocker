import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 550
    height: 800
    title: qsTr("UllApp")
    color: "#ffffff"

    FontLoader { id: birdFont; source: "/LittleBird.ttf" }
    FontLoader { id: scoreFont; source: "/whysoserious.ttf" }
    FontLoader { id: orangeFont; source: "/orange.ttf" }

//    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "iOSMenu.qml").createObject(applicationWindow1, {})
    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})

    Item {
        id: mainArea
        anchors.fill: parent
        state: "doneGame"

        focus: true // important - otherwise we'll get no key events

        Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               state = "startGame"
           }
        }

        states: [
            State {
                name: "startGame"
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
            visible: parent.state === "startGame"
        }


    }
}
