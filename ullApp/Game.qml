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
            if(gamehandler.isNerve(mouse.x, mouse.y, imageArea.width, imageArea.height)){
                gameImage.source = "gameImages/1.png"
                answerText.text = "Correct!"
            }
            else {
                answerText.text = "False, try again"

            }
//            answerText.visible = true

        }
    }
    Text {
        id: questionText
        visible: true
        color: "Pink"
        text: "Where is the femoral nerve?"
        font.pointSize: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: gameImage.top
        anchors.bottomMargin: 50



    }

    Image {
        id: gameImage
        anchors.verticalCenter: parent.verticalCenter
        source: "gameImages/1a.png"
        anchors.right: parent.right
        anchors.left: parent.left
        fillMode: Image.PreserveAspectFit
        visible: true
    }
    Text {
        id: answerText
        visible: true
        text: ""
        font.family: "Arial"
        style: Text.Normal
        font.pointSize: 40
        color:"Pink"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: gameImage.bottom
        anchors.topMargin: 50


    }
}
