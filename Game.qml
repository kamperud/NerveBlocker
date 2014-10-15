import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2


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
        font.pointSize: parent.height / 25 //25
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

//    RowLayout{
//        id: answerlayout
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: gameImage.bottom
//        //anchors.topMargin: 50
//        anchors.bottom: statusBar.top
//        Text {
//            id: answerText
//            visible: true
//            text: gamehandler.answer
//            font.family: "Arial"
//            style: Text.Normal
//            font.pointSize: gameWrapper.height / 25 //40
//            color:"Pink"
//        }
//        Image{
//            id: nextButton
//            visible: gamehandler.nextButtonVisible
//            source: "/arrow-19-512.png"
//            sourceSize.width: 60
//            sourceSize.height: 60
//            MouseArea{
//                anchors.fill: parent
//                onClicked: gamehandler.newTask()
//            }
//        }
//    }
    Rectangle {
        id:statusBar
        anchors.top: gameImage.bottom
        anchors.bottom: parent.bottom
    //    anchors.right: parent.right
    //    anchors.left: parent.left
        width: parent.width


        color: "white"
        border.color: "grey"
        radius: 5

        Rectangle {
            id: rectangle1
            width: parent.width/4
            color: "#ffff00"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.left: parent.left
            anchors.leftMargin: 25
        }

        Rectangle {
            id: rectangle2
            x: 148
            width: parent.width/4
            color: "#ff00ff"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: rectangle3
            x: 275
            width: parent.width/4
            color: "#00ffff"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.right: parent.right
            anchors.rightMargin: 21
        }
    }
}
