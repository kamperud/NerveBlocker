import QtQuick 2.2
import QtQuick.Controls 1.2
import UllApp 1.0

ApplicationWindow {
    id: main
    property string yellowMain: "#f7e967"
    property string yellowLight: "#fffd89"
    property string blueMain: "#04bfbf"
    property string blueLight: "#1fdada"
    property string backgroundGrey: "#222222"


    visible: true

    // 4:3
    //width: 600
    //height: 800

    // 16:9
    width: 450
    height: 800
    // 16:10
    //width: 500
    //height: 800

    title: qsTr("UllApp")
    color: "white"

    FontLoader { id: scoreFont; source: "fonts/Freshman.ttf" }
    FontLoader { id: ubuntu; source: "fonts/Ubuntu-R.ttf" }


    StackView {
        id: mainArea
        anchors.fill: parent
        focus: true // important - otherwise we'll get no key events

        //stops animation between stack changes
        delegate: StackViewDelegate {
            pushTransition: StackViewTransition{}
        }

        Component.onCompleted: {
            push(component_mainMenu);
        }

        // Android back-button
        Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true;
               mainArea.pop(null);
           }
        }
        /*Connections {
            target: Qt.application
            onActiveChanged: {
                if(Qt.application.state !== Qt.ApplicationActive) {
                    while(mainArea.depth>1){
                        mainArea.currentItem.destroy();
                        mainArea.pop();
                    }
                }
            }
        }*/
    }

    Component {
        id: component_GameFinished
        FinishedScreen {
            onMainMenuClicked: {
                mainArea.pop();
                mainArea.pop();
            }
            onPlayAgainClicked: {
                gamehandler.newGame(gamehandler.game.mode);
                mainArea.pop();
                mainArea.pop();
                if(gamehandler.game.mode===Mode.VIDEO){
                    mainArea.push({item:component_video, destroyOnPop: true});
                }
                else if(gamehandler.game.mode===Mode.DRAG){
                    mainArea.push(component_annotation);
                }
                else{
                    mainArea.push(component_game);
                    mainArea.currentItem.startTimer();
                }
            }
        }
    }

    Component {
        id: component_game
        Game {
            id: gameInstance
            game: gamehandler.game
            onGameMenuClicked: {
                mainArea.pop();
            }
            onGameSummaryClicked: {
                mainArea.push(component_GameFinished);
            }
        }
    }

    Component {
        id: component_instructional
        StartMenuInstruction {
            onBackButtonClicked: {
                mainArea.pop();
            }
        }
    }
    Component {
        id: component_about
        About{
            onBackButtonClicked: {
                mainArea.pop();
            }
        }
    }
    Component {
        id: component_video
        VideoTask {
            onGameMenuClicked: {
                mainArea.pop();
            }
            onGameSummaryClicked: {
                mainArea.push(component_GameFinished);
            }
        }
    }

    Component {
        id: component_annotation
        AnnotationTask {
            onGameMenuClicked: {
                mainArea.pop();
            }
            onGameSummaryClicked: {
                mainArea.push(component_GameFinished);
            }
        }
    }


    Component {
        id: component_mainMenu
        StartMenu {
            id: mainMenu

            onBeginnerClicked: {
                gamehandler.newGame(Mode.NORMAL);
                mainArea.push(component_game);
            }
            onTimedClicked: {
                gamehandler.newGame(Mode.TIMED);
                mainArea.push(component_game);
                mainArea.currentItem.startTimer();
            }
            onTutorialClicked: {
                gamehandler.newGame(Mode.TUTORIAL);
                mainArea.push(component_game);
            }
            onVideoClicked: {
                gamehandler.newGame(Mode.VIDEO);
                mainArea.push({item:component_video, destroyOnPop: true});
            }
            onInstructionalClicked: {
                gamehandler.newGame(Mode.NONE);
                mainArea.push(component_instructional);
            }
            onAnnotationClicked: {
                gamehandler.newGame(Mode.DRAG);
                mainArea.push(component_annotation);
            }
            onInfoClicked: {
                gamehandler.newGame(Mode.NONE);
                mainArea.push(component_about);
            }
        }
    }

}
