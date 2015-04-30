import QtQuick 2.0
import QtMultimedia 5.4
import UllApp 1.0;

Rectangle {
    signal gameMenuClicked()
    signal gameSummaryClicked()
    color: backgroundGrey
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
            font.pixelSize:parent.height/6

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left

            width: parent.width*11/12
            wrapMode: Text.WordWrap

            property string text1: "Pause the video when you find the perfect\nposition and click confirm"
            property string text2: "The closest good spot is shown below.\nGo to next page to see your score"

        }
    }
    Video {
        id: taskVideo
        autoPlay: true

        source: task.videoPath

        width: parent.width*11/12
        height: parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/20


        // BUG! in iOS the video resizes to original file width and height
        // if it is allowed to read EndOfFile and then starts playing again.
        // Debugging did not show any wrong values in QML, so we can't fix it
        // The following Timer-element is a hack to try to prevent video from
        // reaching EndOfFile. You can still trick it into resizing though

        Timer{
            id: timer
            interval: 50
            repeat: true
            running: true
            onTriggered:{
                if(parent.position>5000 && (parent.duration - parent.position)<200){
                    parent.seek(0);
                }
            }
        }

        onPaused:{
            videoController.playVisible = true;
            timer.stop();

        }
        onPlaying:{
            videoController.playVisible = false;
            timer.restart();
        }

    }



    VideoBar {
        id: videoController
        progressBarPecent: taskVideo.position*100/taskVideo.duration
        movieLength: taskVideo.duration
        taskActive: active
        z: 1
        height: main.height/main.width<1.5 ? parent.height/10:parent.height/8


        anchors.bottom: menuButton.top

        onPlayClicked: {
            if (taskVideo.playbackState===MediaPlayer.PlayingState) {
                taskVideo.pause();
            }
            else {
                taskVideo.play();
            }
        }
        onProgressClicked: {
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
                var bestTime = task.answerVideoTask(taskVideo.position);
            }

            //NEXT
            else {
                gameSummaryClicked();
            }
        }
    }
}

