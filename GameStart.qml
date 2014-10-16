import QtQuick 2.0

Rectangle {
    id: gamestart
    width: 450
    height: 300
    color: "#333333"

    FontLoader { id: birdFont; source: "/LittleBird.ttf" }

    Text {
        text: "THE NERVES OF \nSOME PEOPLE"
        anchors.horizontalCenterOffset: 0
        font.family: birdFont.name
        font.pixelSize: parent.width/11
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/3
        anchors.verticalCenter: parent.verticalCenter


        color: "yellow"
    }

    Rectangle {
        id: playbutton
        width: parent.width/2
        height: width/2+10
        color: playArea.pressed ? "#ee606060" :"#ee202020"
        border.color: "#B3B3B3"
        radius: 40
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -30
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
            font.pixelSize: parent.width/3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "yellow"
        }
    }

    Rectangle {
        id: infobutton
        x: 165
        width: parent.width/6
        height: width/2+10
        color: infoArea.pressed ? "#ee606060" :"#ee202020"
        radius: 20
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: parent.height/5
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
            font.pixelSize: parent.width/3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "yellow"

        }


    }
}
