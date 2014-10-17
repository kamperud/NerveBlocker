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

    /*
    menuBar for !iOS
    toolbar for iOS
    menuBar: Qt.createComponent(sys.isIos ? "" : "AndroidMenu.qml").createObject(applicationWindow1,{})
    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})
    */
    //Hannas test bar
    toolBar:Qt.createComponent("iOSMenu.qml").createObject(applicationWindow1, {})

    Rectangle {
        id: gameFinishedScreen
        width: parent.width
        height: parent.height
        color: "#202020"

        FontLoader { id: birdFont; source: "/LittleBird.ttf" }
        FontLoader { id: scoreFont; source: "/whysoserious.ttf" }
        FontLoader { id: orangeFont; source: "/orange.ttf" }


        Item{
            id:finishedInfo
            width: parent.width
            height: parent.height * 4 / 5
            anchors.top: parent.top
            Rectangle{
                id: gameFinishedBox
                width: parent.width / 1.5
                anchors.horizontalCenter: parent.horizontalCenter
                border.color: "#B3B3B3"
                color: "#333333"
                radius: 5
                anchors.top: parent.top
                anchors.topMargin: parent.height/8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height/5

                Text{
                    id: finalscore
                    text: "FINAL SCORE"
                    font.family: birdFont.name
                    font.pixelSize: parent.width/12
                    color: "yellow"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: gameFinishedScreen.height / 30
                }
                Text{
                    id:finalpoints
                    text: "2250" //gamehandler.points
                    font.family: scoreFont.name
                    color: "yellow"
                    font.pixelSize: parent.width/4
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: finalscore.bottom
                    anchors.topMargin: 0 //gameFinishedScreen.height / 60
                }
                Text{
                    id: timespent
                    text: "You spent 14 seconds" //"You spent "+gamehandler.timeSpent+" seconds"
                    color: "yellow"
                    font.pixelSize: parent.width/12
                    font.family: orangeFont.name
                    wrapMode: Text.WordWrap

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: finalpoints.bottom
                    anchors.topMargin: parent.height/5

                }
                Row {
                    id: row
                    spacing: parent.width/20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height/15
                    Text{
                        id:highestscore
                        text: "High Score:"
                        font.family: birdFont.name
                        color: "yellow"
                        font.pixelSize: gameFinishedBox.width/15

//                        anchors.bottomMargin: parent.width/10
//                        anchors.bottom: parent.bottom
//                        anchors.horizontalCenterOffset: -50
//                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Text{
                        id:highestpoints
                        text: "10 000"
                        color: "yellow"
                        font.pixelSize: gameFinishedBox.width/10
                        font.family: scoreFont.name
                        anchors.baseline: highestscore.baseline

                        /*anchors.horizontalCenterOffset: 50
                        anchors.bottomMargin: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom */
                    }
                }
            }
        }

        Item{
            id: finishButtons
            width: parent.width
            height:parent.height / 5
            anchors.bottom: parent.bottom

            Rectangle {
                id: mainMenuButton
                width: finishButtons.width / 4
                height: 40
                //anchors.verticalCenter: finishButtons.verticalCenter
                anchors.top: parent.top
                anchors.horizontalCenter: finishButtons.horizontalCenter
                anchors.horizontalCenterOffset: -70
                color: "#80E0E0E0"
                border.color: "#B3B3B3"
                radius: 5
                Text{
                    text: "Main \n Menu"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: againButton
                width: finishButtons.width / 4
                height: 40
                //anchors.verticalCenter: finishButtons.verticalCenter
                anchors.top: parent.top
                anchors.horizontalCenter: finishButtons.horizontalCenter
                anchors.horizontalCenterOffset: 70
                color: "#80E0E0E0"
                border.color: "#B3B3B3"
                radius: 5
                Text{
                    text: "Play \n Again"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

                /*
                MouseArea{
                    anchors.fill: parent
                }
                */
            }
        }
    }


    /*
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
    */
}

