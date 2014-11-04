import QtQuick 2.0

Rectangle {
    id: gameFinishedScreen
    width: parent.width
    height: parent.height
    color: "#202020"




    Item{
        id:finishedInfo
        width: parent.width
        height: parent.height * 4 / 5
        anchors.top: parent.top

        Rectangle{
            id: gameFinishedBox
            width: parent.width / 1.3
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "#B3B3B3"
            color: "#333333"
            radius: 30
            anchors.top: parent.top
            anchors.topMargin: parent.height/8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/5

            Text{
                id: finalscore
                text: "FINAL SCORE"
                font.family: birdFont.name
                font.pixelSize: parent.width/10
                color: "yellow"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: gameFinishedScreen.height / 30
            }
            Text{
                id:finalpoints
                text: (gamehandler.points - gamehandler.timeSpent*10) < 0 ? 0: gamehandler.points - gamehandler.timeSpent*10
                font.family: scoreFont.name
                color: "#ffcf0b"
                font.pixelSize: parent.width/3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: finalscore.bottom
                anchors.topMargin: 0 //gameFinishedScreen.height / 60
            }
            Text{
                id: timespent
                text: "You spent\n"+ gamehandler.timeSpent +" seconds"
                color: "yellow"
                font.pixelSize: parent.width/10
                font.family: orangeFont.name

                horizontalAlignment: Text.AlignHCenter

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: finalpoints.bottom
                anchors.topMargin: parent.height/25

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
                    font.pixelSize: gameFinishedBox.width/12
                }

                Text{
                    id:highestpoints
                    text: gamehandler.highscore
                    color: "#ffcf0b"
                    font.pixelSize: gameFinishedBox.width/9
                    font.family: scoreFont.name
                    anchors.baseline: highestscore.baseline

                }
            }
        }
    }

    Row {
        id: finishButtons
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/8
        spacing: parent.width/6

        Rectangle {
            id: mainMenuButton
            width: gameFinishedScreen.width / 4
            height: width

            border.color: "#B3B3B3"
            color: menuButton.pressed ?  "#ee606060" :"#333333"
            radius: 30
            Text{
                text: "Main \nMenu"
                color: "yellow"
                font.pixelSize: parent.width/4
                font.family: birdFont.name

                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                id: menuButton
                anchors.fill: parent
                onClicked: {
                    mainArea.state = "startGame"
                }
            }
        }

        Rectangle {
            id: againButton
            width: gameFinishedScreen.width / 4
            height: width

            border.color: "#B3B3B3"
            color: playButton.pressed ?  "#ee606060" :"#333333"
            radius: 30
            Text{
                text: "Play \nAgain"
                color: "yellow"
                font.family: birdFont.name
                font.pixelSize: parent.width/4


                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
            }


            MouseArea{
                id: playButton
                anchors.fill: parent
                onClicked: {
                    gamehandler.newGame()
                    mainArea.state = "inGame"
                }
            }

        }
    }
}
