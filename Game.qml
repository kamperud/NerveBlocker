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
        font.pixelSize: parent.width/15
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

    Rectangle {
        id:statusBar
        anchors.top: gameImage.bottom
        anchors.bottom: parent.bottom
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
            MouseArea {
                anchors.fill: parent
                onClicked: gamehandler.newTask()
            }
        }
    }
}
