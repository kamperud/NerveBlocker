import QtQuick 2.0

Rectangle {
    id: gamestart
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
}
