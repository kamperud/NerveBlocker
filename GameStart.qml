import QtQuick 2.0

Rectangle {
    id: gamestart
    width: 450
    height: 300
    color: "black"

    FontLoader { id: birdFont; source: "/LittleBird.ttf" }

    Rectangle {
        id: playbutton
        x: 48
        width: parent.width/4
        height: width/2+10
        color: playArea.pressed ? "#80e0e0e0": "#80808080"
        border.color: "#B3B3B3"
        radius: 20
        anchors.horizontalCenterOffset: -75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: playArea
            anchors.fill: parent
            onClicked: {
                gamehandler.newGame()
                mainArea.state = "inGame"
            }
        }
        Text {
            text: "PLAY"
            font.family: birdFont.name
            font.pixelSize: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "yellow"
        }
    }

    Rectangle {
        id: infobutton
        x: 165
        width: parent.width/4
        height: width/2+10
        color: infoArea.pressed ? "#80e0e0e0": "#80808080"
        radius: 20
        anchors.horizontalCenterOffset: 75
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#b3b3b3"


        MouseArea {
            id: infoArea
            anchors.fill: parent
            onClicked: mainArea.state = "infoGame"
        }

        Text {
            text: "INFO"
            font.family: birdFont.name
            font.pixelSize: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "yellow"

        }

    }
}
