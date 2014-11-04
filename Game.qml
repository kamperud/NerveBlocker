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

    MouseArea{
        id: imageArea
        anchors.fill: gameImage
        onClicked: {
            if(!gamehandler.nextButtonVisible) {
                crox.x = mouse.x - 25
                crox.y = mouse.y + gameImage.y - 25

            }
           gamehandler.imageClicked(mouse.x, mouse.y, imageArea.width, imageArea.height)
        }
    }

    Rectangle{
        id: topSection
        width:parent.width
        anchors.top: parent.top
        anchors.bottom: gameImage.top
        //color: gamehandler.answer
        gradient: Gradient {
            GradientStop { position: 0.67; color: gamehandler.answer}
            GradientStop { position: 1.0; color: "black"}
        }
        Rectangle{
            id: questionBox
            visible:true
            width: questionText.paintedWidth + 50
            height: questionText.paintedHeight + 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "#80E0E0E0"
            border.color: "#5B5B5B"
            radius: 10
            Text {
                id: questionText
                visible: true
                color: "black"
                text: gamehandler.question
                font.pixelSize: gameWrapper.width/15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

        }
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
    Image {
        id: crox
        z: 1
        x: 0
        y: 0
        visible: gamehandler.nextButtonVisible
        source: "/cancel-50.png"
    }

    Rectangle {
        id:statusBar
        anchors.top: gameImage.bottom
        anchors.bottom: parent.bottom
        width: parent.width
                gradient: Gradient {
             GradientStop { position: 0.0; color: "black"}
             GradientStop { position: 0.33; color: gamehandler.answer}
        }


        Rectangle {
            id: multiplier
            width: parent.width/4
            color: "#80E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 25
            radius: 20
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
            color: "#80E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 20
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
            height: width
            color: "#80E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin:50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 21
            radius: 20
            MouseArea {
                id: nextArea
                anchors.fill: parent
                onClicked: {
                    if(!gamehandler.gameFinished) {
                        gamehandler.newTask()
                    } else {
                        mainArea.state = "doneGame"
                    }
                }
            }
            Image {
                id: nextButton
                width: rectangle3.width
                height: rectangle3.height
                source: nextArea.pressed && gamehandler.nextButtonVisible ? "/arrow-19-grey.png" : "/arrow-19-512.png"
            }
        }
    }
}
