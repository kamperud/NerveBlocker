import QtQuick 2.0
import UllApp 1.0


Rectangle {
    property var game: gamehandler.game
    property bool taskXSet: false
    property bool taskConfirmed: false


    property var startTime
    property var answerTime
    property real bonusTime: 0.15
    property int maxTime: 15000

    property var unscaledX
    property var unscaledY
    signal gameMenuClicked()
    signal gameSummaryClicked()
    state: "ingame"
    color: "#222222"

    property var unscaledX1
    property var unscaledX2
    property var unscaledX3
    property var unscaledY1
    property var unscaledY2
    property var unscaledY3

    Timer{
        id: timer
        interval: maxTime
        running: true
        onTriggered: {
            if(gamehandler.game.mode === Mode.TIMED){
                gamehandler.game.finishedChanged(true);
                gameSummaryClicked();
            }
        }
    }

    function startTimer(){
        timer.running = true;
        task.progressBarWidth = task.progressBarStarterWidth;
        task.progressBarRunning = true;
        startTime = new Date();
    }


    function addTime(){
        // Calculate new time with added bonus time
        answerTime = new Date();
        var timeDiff = answerTime.getTime() - startTime.getTime();
        timeDiff = timer.interval - timeDiff;
        timer.interval = timeDiff + maxTime*bonusTime;

        // Calculate new animation bar width
        task.progressBarWidth += task.progressBarStarterWidth*bonusTime;

        // Make sure new time doesnt surpass maximum time
        if(timer.interval>maxTime) {
            timer.interval = maxTime;
            task.progressBarWidth = task.progressBarStarterWidth;
        }

        // Restart animation and timer with new values
        task.seqAnimation.restart();
        timer.restart();

        startTime = new Date();
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

    //POINTS box
    GamePointsBox {
        id: topPoints
        contentText: gamehandler.game.points
        width: parent.width*4.5/12
        height: parent.height/10
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.top: parent.top
        anchors.topMargin: parent.width/20
    }

    //MULTIPLIER box
    GamePointsBox {
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

    //TASK
    GameTask {
        id: task
        task: game.currentTask
        progressBarInterval:timer.interval
        anchors.top: topPoints.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: botMenu.top
    }

    //MENU button
    MenuButton {
        id: botMenu
        onMenuClicked: {
            gameMenuClicked();
        }
    }

    NextButton {
        id: botNext
    }
}
