import QtQuick 2.0

Rectangle {
    id: gameWrapper
    x: 0
    y: 0
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    color: "#000000"


    MouseArea{
        id: imageArea
        anchors.fill: gameImage
        onClicked: {
            gamehandler.imageClicked(mouse.x, mouse.y, imageArea.width, imageArea.height)
        }
    }
    Text {
        id: questionText
        visible: true
        color: "Pink"
        text: gamehandler.question
        font.pointSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: gameImage.top
        anchors.bottomMargin: 50

    }

    Image {
        id: gameImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: (parent.width>parent.height) ? parent.height : sourceSize.height*parent.width/sourceSize.width
        width:  (parent.width<parent.height) ? parent.width : sourceSize.width*parent.height/sourceSize.height

        source: gamehandler.image
        fillMode: Image.PreserveAspectFit
        visible: true
    }
    Text {
        id: answerText
        visible: true
        text: gamehandler.answer
        font.family: "Arial"
        style: Text.Normal
        font.pointSize: 40
        color:"Pink"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: gameImage.bottom
        anchors.topMargin: 50


    }
}
