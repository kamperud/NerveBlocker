import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2


Rectangle {
    id: gameWrapper
    x: 0
    y: 0
    anchors.fill: parent
    color: "#222222"

    Rectangle {
        id: topPoints
        color: "#f7e967"
        radius: 15
        width: parent.width*4.5/12
        height: parent.height/10
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.top: parent.top
        anchors.topMargin: parent.width/20

        Text {
            text: qsTr("POINTS")
            font.family: ubuntu.name
            font.pixelSize: parent.height/3

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: gamehandler.points
            font.pixelSize: parent.height/1.5
            font.family: scoreFont.name

            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }

    Rectangle {
        id: topMulti
        color: "#f7e967"
        radius: 15
        width: parent.width*4.5/12
        height: parent.height/10
        anchors.top: parent.top
        anchors.topMargin: parent.width/20
        anchors.right: parent.right
        anchors.rightMargin: parent.width/12

        Text {
            text: "x" + gamehandler.multiplier
            font.pixelSize: parent.height/1.5
            font.family: scoreFont.name

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: qsTr("MULTIPLIER")
            font.family: ubuntu.name
            font.pixelSize: parent.height/3

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
        }

    }


    Item {
        anchors.top: topPoints.bottom
        anchors.bottom: gameImage.top
        anchors.left: parent.left
        anchors.right: parent.right

        Text {
            color: "#ffffff"
            text: qsTr("Touch the")
            font.family: ubuntu.name
            font.pixelSize:parent.height/5

            visible: !gamehandler.nextButtonVisible

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -question2Feedback.font.pixelSize
            anchors.right: parent.right
            anchors.left: parent.left
        }

        Text {
            id: question2Feedback
            font.bold: true
            font.pixelSize: parent.height/4
            font.family: ubuntu.name

            text: gamehandler.question
            color: gamehandler.answer

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Rectangle {
        width: gameImage.width/2
        height: gameImage.height/20
        color: "#f7e967"
        visible: gameWrapper.visible && gamehandler.timed

        z: 1
        x: gameImage.x
        anchors.bottom: gameImage.top
    }

    Rectangle {
        width: gameImage.width
        height: gameImage.height/20
        color: "#666666"
        visible: gameWrapper.visible && gamehandler.timed

        x: gameImage.x
        anchors.bottom: gameImage.top
    }

    Image {
        id: gameImage
        width: parent.width*11/12
        height: sourceSize.height*width/sourceSize.width
        anchors.bottom: botMenu.top
        anchors.bottomMargin: parent.width/20
        anchors.horizontalCenter: parent.horizontalCenter


        fillMode: Image.PreserveAspectFit
        source: gamehandler.image

        Image {
            id: crox
            z: 1
            x: 0
            y: 0
            width: parent.width/10
            height: width
            visible: gamehandler.nextButtonVisible
            source: "icons/cancel-50.png"
        }
        MouseArea {
            id: imageArea
            anchors.fill: parent
            onClicked: {
                if(!gamehandler.nextButtonVisible) {
                    crox.x = mouse.x - crox.width/2;
                    crox.y = mouse.y - crox.width/2;
                }
                var unscaledX = gameImage.sourceSize.width*mouse.x/width;
                var unscaledY = gameImage.sourceSize.height*mouse.y/height;
                gamehandler.game.currentTask.answerTask(unscaledX, unscaledY);
            }
        }
    }


    Rectangle {
        id: botMenu
        width: parent.width*4.5/12
        height: parent.height/10
        color: menuButton.pressed ?  "#cafcd8" :"#04bfbf"
        radius: 15
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width/20

        Text {
            color: "#ffffff"
            text: qsTr("MENU")
            font.family: ubuntu.name
            font.pixelSize: parent.height/2.5

            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
        }

        MouseArea {
            id: menuButton
            anchors.fill: parent
            onClicked: mainArea.state = "startGame"
        }
    }

    Rectangle {
        id: botNext
        width: parent.width*4.5/12
        height: parent.height/10
        color: nextButton.pressed && gamehandler.nextButtonVisible ?  "#cafcd8" :"#04bfbf"
        radius: 15
        anchors.right: parent.right
        anchors.rightMargin: parent.width/12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width/20

        Image {
            id: image1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            source: "icons/arrow-19-512.png"
        }

        MouseArea {
            id: nextButton
            anchors.fill: parent
            onClicked: {
                if(!gamehandler.gameFinished) {
                    gamehandler.newTask()
                } else {
                    mainArea.state = "doneGame"
                }
            }
        }
    }

}



























