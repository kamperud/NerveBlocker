import QtQuick 2.0

Rectangle {
    id: gameStart
    width: 300
    height: 500
    color: "#222222"

    Text {
        color: "#f7e967"
        text: "THE NERVES OF \nSOME PEOPLE"
        horizontalAlignment: Text.AlignHCenter
        font.family: ubuntu.name
        font.pixelSize: parent.width/11
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/3
    }

    Rectangle {
        color: beginnerLevel.pressed ? "#1fdada"  : "#04bfbf"
        radius: 15

        width: parent.width*3/4
        height: width/3

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/7
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: beginnerLevel
            anchors.fill: parent
            onClicked: {
                gamehandler.timed = false
                gamehandler.newGame()
                mainArea.state = "inGame"
            }
        }

        Text {
            color: "#ffffff"
            text: qsTr("BEGINNER")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.family: ubuntu.name
            font.pixelSize: parent.width/8
        }
    }

    Rectangle {
        color: timedLevel.pressed ? "#1fdada" : "#04bfbf"
        radius: 15

        width: parent.width*3/4
        height: width/3

        anchors.verticalCenterOffset: parent.height/20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: timedLevel
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {
                gamehandler.timed = true
                gamehandler.newGame()
                mainArea.state = "inGame"
            }
        }

        Text {
            color: "#ffffff"
            text: qsTr("TIMED")
            font.family: ubuntu.name
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width/8
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
        }
    }

    Rectangle {
        color: infoArea.pressed ? "#fff987" : "#f7e967"
        radius: 10

        width: parent.width/4
        height: width/2

        anchors.verticalCenterOffset: parent.height/4
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: infoArea
            anchors.fill: parent
            onClicked: mainArea.state = "infoGame"
        }

        Text {

            color: "#000000"
            text: qsTr("INFO")
            font.family: ubuntu.name
            font.pixelSize: parent.width/5
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
        }
    }

}
