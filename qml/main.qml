import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 300
    height: 500
    title: qsTr("UllApp")
    color: "#ffffff"

    FontLoader { id: birdFont; source: "fonts/LittleBird.ttf" }
    FontLoader { id: scoreFont; source: "fonts/whysoserious.ttf" }
    FontLoader { id: orangeFont; source: "fonts/orange.ttf" }
    FontLoader { id: ubuntu; source: "fonts/Ubuntu-R.ttf" }

    Item {
        id: mainArea
        anchors.fill: parent
        state: "mainMenu"

        focus: true // important - otherwise we'll get no key events

        Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               state = "mainMenu"
           }
        }

        states: [
            State {
                name: "mainMenu"
            },
            State {
                name: "inGame"
            },
            State {
                name: "doneGame"
            }
        ]

        Component {
            id: component_game
            Item {
                Game {
                    anchors.fill: parent
                    game: gamehandler.game
                    visible: mainArea.state === "inGame"
                }
            }
        }
        Loader {
            id: loader_game
            sourceComponent: gamehandler.game ? component_game : undefined
            anchors.fill: parent
        }

        GameFinished {
            id: gamefinished
            anchors.fill: parent
            visible: parent.state === "doneGame"
        }

        MainMenu {
            id: gamestart
            anchors.fill: parent
            visible: parent.state === "mainMenu"
        }


    }
}
