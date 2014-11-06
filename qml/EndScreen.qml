import QtQuick 2.0

Rectangle {
    id: gameFinishedScreen
    width: 300
    height: 500
    color: "#333333"

    Rectangle {
        id: rectangle1
        x: 40
        y: 38
        width: 224
        height: 301
        color: "#ffffff"

        Text{
            id: scoreText
            text: qsTr("FINAL SCORE")
            color: "#04bfbf"

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id:scoreNumber
            text: "2750" //gamehandler.timed ? gamehandler.points - gamehandler.timeSpent*10: gamehandler.points
            color: "#04bfbf"


            anchors.top: scoreText.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id:nofCorrectText
            text: qsTr("You got")
            color: "#04bfbf"

            anchors.top: scoreNumber.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id:nofCorrectNumber
            text: "8" + "/" + "10"
            color: "#04bfbf"

            anchors.top: nofCorrectText.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Row{
           id: highestscoreRow

           anchors.horizontalCenter: parent.horizontalCenter
           anchors.bottom: parent.bottom

           Text{
               id:highestscoreText
               text: "High Score:"
               color: "#04bfbf"
           }

           Text{
               id:highestscoreNumber
               text: "3000" //gamehandler.timed ? gamehandler.timed_highscore :gamehandler.highscore
               color: "#04bfbf"

               anchors.baseline: highestscoreText.baseline

           }
        }
    }

    Rectangle {
        id: buttMainMenu
        x: 40
        y: 378
        width: 86
        height: 74
        color: "#04bfbf"
        radius: 15

        Text{
            color: "#ffffff"
            text: qsTr("MAIN")

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter

        }
        Text{
            color: "#ffffff"
            text: qsTr("MENU")

            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.left: parent.left
        }

    }

    Rectangle {
        id: buttPlayAgain
        x: 170
        y: 378
        width: 94
        height: 74
        color: "#04bfbf"
        radius: 15

        Text{
            color: "#ffffff"
            text: qsTr("PLAY")

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            color: "#ffffff"
            text: qsTr("AGAIN")

            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }







}
