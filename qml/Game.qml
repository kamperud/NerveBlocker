import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import UllApp 1.0;

Rectangle {
    property var task1: gamehandler.game.currentTask
    property var game: gamehandler.game

    //todo move to a service
    function getOrganName(organ){
        switch(organ){
        case Organ.FEMUR:
            return "Femur";
        case Organ.ARTERY:
            return "Femoral Artery";
        case Organ.ILIACA:
            return "Fascia Iliaca";
        case Organ.LATA:
            return "Fascia lata";
        case Organ.NERVE:
            return "Femoral Nerve";
        default:
            return "Unknown";
        }
    }

    id: gameWrapper
    anchors.fill: parent
    color: "#222222"

    PointsBox {
        id: topPoints
        contentText: gamehandler.game.points
        width: parent.width*4.5/12
        height: parent.height/10
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.top: parent.top
        anchors.topMargin: parent.width/20
    }

    PointsBox {
        id: topMulti
        contentText: "x" + gamehandler.game.multiplier
        labelText: qsTr("MULTIPLIER")
        width: parent.width*4.5/12
        height: parent.height/10
        anchors.top: parent.top
        anchors.topMargin: parent.width/20
        anchors.right: parent.right
        anchors.rightMargin: parent.width/12
    }

    Task {
        task: game.currentTask
        anchors.top: topPoints.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: botMenu.top
    }

    Rectangle {
        width: taskImage.width/2
        height: taskImage.height/20
        color: "#f7e967"
        visible: gameWrapper.visible && gamehandler.timed

        z: 1
        x: taskImage.x
        anchors.bottom: taskImage.top
    }

    Rectangle {
        width: taskImage.width
        height: taskImage.height/20
        color: "#666666"
        visible: gameWrapper.visible && gamehandler.timed

        x: taskImage.x
        anchors.bottom: taskImage.top
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
