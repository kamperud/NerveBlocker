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
            gamehandler.imageClicked(mouse.x, mouse.y, imageArea.width, imageArea.height)
        }
    }

    Rectangle{
        id: topSection
        width:parent.width
        anchors.top: parent.top
        anchors.bottom: gameImage.bottom
//        color: gamehandler.answer
        gradient: Gradient {
            GradientStop { position: 0.0; color: gamehandler.answer}
//             GradientStop { position: 0.33; color: gamehandler.answer}
             GradientStop { position: 0.50; color: "black"}
        }
    Rectangle{
            id: questionBox
            visible:true
            width: gamehandler.question.length*10
            height: gameWrapper.height / 20
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.bottomMargin: 50
            //anchors.topMargin: 5000
            color: "#4C4C4C"
            border.color: "#5B5B5B"
            radius: 10
            Text {
                id: questionText
                visible: true
                color: "Pink"
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

    Rectangle {
        id:statusBar
        anchors.top: gameImage.bottom
        anchors.bottom: parent.bottom
        width: parent.width
//        color: "white"
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
            anchors.topMargin: 30
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
            anchors.topMargin: 30
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
            color: "#80E0E0E0"
            border.color: "#B3B3B3"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 21
            radius: 20
            MouseArea {
                anchors.fill: parent
                onClicked: gamehandler.newTask()
            }
            Image {
                id: nextButton
                width: rectangle3.width
                height: rectangle3.height
                source: "/arrow-19-512.png"
            }
        }
    }
}
