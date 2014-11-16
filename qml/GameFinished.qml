import QtQuick 2.0

Rectangle {
    signal mainMenuClicked()
    signal playAgainClicked()
    property var game: gamehandler.game
    id: gameFinishedScreen
    width: 300
    height: 500
    color: "#333333"

    Rectangle {
        id: rectangle1
        width: parent.width / 1.3
        height: parent.height * 8/15
        color: "#f7e967"
        radius: 15
        anchors.top: parent.top
        anchors.topMargin: parent.height/10
        anchors.horizontalCenter: parent.horizontalCenter


        Text{
            id: scoreText
            text: qsTr("FINAL SCORE")
            font.family: ubuntu.name
            font.pixelSize: parent.width/10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: gameFinishedScreen.height / 30
        }

        Text{
            id:scoreNumber
            text: game.points

            font.family: scoreFont.name
            font.pixelSize: parent.width/4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: scoreText.bottom
            anchors.topMargin: parent.height/20
        }

        Text{
            id:nofCorrectText
            text: qsTr("You got " + "8" + "/" + "10")
            font.pixelSize: parent.width/10
            font.family: ubuntu.name


            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: scoreNumber.bottom
            anchors.topMargin: parent.height/8
            horizontalAlignment: Text.AlignHCenter

        }

        Row{
           id: highestscoreRow
           spacing: parent.width/20
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.bottom: parent.bottom
           anchors.bottomMargin: parent.height/15

           Text{
               id:highestscoreText
               text: "High Score:"
               font.family: ubuntu.name
               font.pixelSize: parent.parent.width/12
           }

           Text{
               id:highestscoreNumber
               text: gamehandler.highscore
               font.family: scoreFont.name
               font.pixelSize: parent.parent.width/9
               anchors.baseline: highestscoreText.baseline
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
            id: buttMainMenu
            width: parent.parent.width / 4
            height: width
            color: "#04bfbf"
            radius: 15

            Text{
                color: "#ffffff"
                text: "Main \nMenu"
                font.pixelSize: parent.width/4
                font.family: ubuntu.name

                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                id: menuButton
                anchors.fill: parent
                onClicked: {
                    mainMenuClicked();
                }
            }

        }

        Rectangle {
            id: buttPlayAgain
            width: parent.parent.width / 4
            height: width

            color: "#04bfbf"
            radius: 15

            Text{
                text: "Play \nAgain"
                color: "#ffffff"
                font.family: ubuntu.name
                font.pixelSize: parent.width/4


                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseArea{
                id: playButton
                anchors.fill: parent
                onClicked: {
                    playAgainClicked();
                }
            }
        }
    }
}
