import QtQuick 2.0

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
