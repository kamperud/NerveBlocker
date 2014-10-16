import QtQuick 2.0

Rectangle {
    id: gameend
    width: 100
    height: 62



    Rectangle {
        id: button
        width: parent.width/4
        height: width
        color: "#80E0E0E0"
        border.color: "#B3B3B3"
        anchors.right: parent.right
        anchors.rightMargin: 113
        radius: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        MouseArea {
            anchors.fill: parent
            onClicked: {
                gamehandler.newGame()
                mainArea.state = "inGame"
            }
        }
        Image {
            id: nextButton
            width: button.width
            height: button.height
            source: "/arrow-19-512.png"
        }
    }

    Text {
        id: text1
        x: 138
        text: "You spent "+gamehandler.timeSpent+" seconds";
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: button.top
        anchors.bottomMargin: 53
        anchors.top: parent.top
        anchors.topMargin: 118
        font.pixelSize: 12
    }
}
