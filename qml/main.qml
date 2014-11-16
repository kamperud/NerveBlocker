import QtQuick 2.0
import QtQuick.Controls 1.2
import UllApp 1.0

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

    Component {
        id: component_GameFinished
        GameFinished {
            onMainMenuClicked: {
                mainArea.pop();
                mainArea.pop();
            }
            onPlayAgainClicked: {
                gamehandler.newGame(gamehandler.game.mode);
                mainArea.pop();
            }
        }
    }

    Component {
        id: component_game
        Game {
            game: gamehandler.game
            onMenuClicked: {
                mainArea.pop();
            }
            onGameSummaryClicked: {
                mainArea.push(component_GameFinished);
            }
        }
    }

    Component {
        id: component_mainMenu
        MainMenu {
            id: mainMenu
            onBeginnerClicked: {
                gamehandler.timed = false;
                gamehandler.newGame(Mode.NORMAL);

                mainArea.push(component_game);
            }
            onTimedClicked: {
                gamehandler.timed = true;
                gamehandler.newGame(Mode.TIMED);
                mainArea.push(component_game);
            }
            onTutorialClicked: {
                gamehandler.timed = false;
                gamehandler.newGame(Mode.TUTORIAL);

                mainArea.push(component_game);
            }
        }
    }

    StackView {
        id: mainArea
        anchors.fill: parent
        focus: true // important - otherwise we'll get no key events

        delegate: StackViewDelegate {
            pushTransition: StackViewTransition{}
        }

        Component.onCompleted: {
            push(component_mainMenu);
        }

//        Keys.onReleased: {
//           if (event.key === Qt.Key_Back) {
//               event.accepted = true
//               //TODO eventually goto mainmenu
//           }
//        }

    }
}
