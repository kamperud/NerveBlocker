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
        //border.color: "grey"
        //radius: 5

        Rectangle {
            id: multiplier
            width: parent.width/4
            color: "#E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.left: parent.left
            anchors.leftMargin: 25
            radius: 5
            Text {
                text: "x" + gamehandler.multiplier
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: multiplier.width / 3
            }
        }

        Rectangle {
            id: points
            x: 148
            width: parent.width/4
            color: "#E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 5
            Text {
                text: gamehandler.points
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: multiplier.width / 3
            }
        }

        Rectangle {
            id: rectangle3
            x: 275
            width: parent.width/4
            color: "#E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            anchors.right: parent.right
            anchors.rightMargin: 21
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: gamehandler.newTask()
            }
            Image {
                id: nextButton
                width: rectangle3.width
                height: rectangle3.height
                source: gamehandler.nextButtonVisible ? "/arrow-19-512-green.png" : "/arrow-19-512.png"
            }
        }
    }
}
