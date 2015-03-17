import QtQuick 2.0
import QtMultimedia 5.4
import UllApp 1.0;

Rectangle {
    signal gameMenuClicked()
    signal gameSummaryClicked()
    color: "#222222"
    property var task: gamehandler.game.currentVideoTask
    property bool active: true

    Item {
        id: textArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: parent.height/6;

        Text {
            id: title
            text: task.answered ? text2 : text1
            color: "white"
            font.family: ubuntu.name
            font.pixelSize:parent.height/5

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left


            property string text1: "Pause the video when\n you find the perfect position\n and click confirm"
            property string text2: "The closest good spot\n is shown below. Go to next\n page to see your score"

        }
    }
    Video {
        id: taskVideo
        autoPlay: true

        source: task.videoPath

        // Don't fuck with the following values. iOS needs these
        width: parent.width*11/12
        height: parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/20

        onStopped: {
            play();
        }
    }



    VideoBar {
        id: videoController
        progressBarPecent: taskVideo.position*100/taskVideo.duration
        movieLength: taskVideo.duration

        anchors.bottom: menuButton.top

        onPlayClicked: {
            if(active === false)    return
            if (taskVideo.playbackState===MediaPlayer.PlayingState) {
                taskVideo.pause();
                playVisible = true;
            }
            else {
                taskVideo.play();
                playVisible = false;
            }
        }
        onProgressClicked: {
            if(active === false)    return
            taskVideo.seek(circleDistance*taskVideo.duration);
        }
    }

    MenuButton {
        id: menuButton
        onMenuClicked: {
            gameMenuClicked();
        }
    }

    NextButton {
        id: nextButton
        arrowVisible: false
        onNextClicked: {
            //Game done
            if(!arrowVisible){
                arrowVisible = true;
                taskVideo.pause();
                videoController.playVisible = true;
                active = false;
                var bestTime = gamehandler.game.currentVideoTask.answerVideoTask(taskVideo.position);
                taskVideo.seek(bestTime);
            }

            //NEXT
            else {
                gameSummaryClicked();
            }
        }
    }
}

