import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import UllApp 1.0;

Rectangle {
    property var game: gamehandler.game
    signal menuClicked()
    signal gameSummaryClicked()
    state: "ingame"

    Timer{
        id: timer
        interval: 10000
        running: true
        onTriggered: {
            if(gamehandler.game.mode === Mode.TIMED)
                gameSummaryClicked();
        }
    }

    function startTimer(){
        timer.running = true;
        task.progressBarWidth = task.progressBarStarterWidth;
        task.progressBarRunning = true;
    }

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
        id: task
        task: game.currentTask
        progressBarInterval:timer.interval
        anchors.top: topPoints.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: botMenu.top
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
            onClicked: {
                menuClicked();
            }
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
                if(game.finished&&gamehandler.game.mode!==Mode.TIMED) {
                    gameSummaryClicked();
                } else if (game.currentTask.answered){
                    game.newTask()
                }
            }
        }
    }

}
