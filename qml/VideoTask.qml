import QtQuick 2.0
import QtMultimedia 5.4
import UllApp 1.0;

Rectangle {
    signal gameMenuClicked()
    signal videoRestarted()
    signal tempVideoPaused()
    color: "#222222"

    Item {
        id: textArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: parent.height/5;

        Text {
            id: title
            text: "Pause the video when\n you find the perfect position\n and click confirm"
            color: "white"
            font.family: ubuntu.name
            font.pixelSize:parent.height/5

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left

        }
    }
    Video {
        id: taskVideo
        autoPlay: true

        source: gamehandler.game.currentVideoTask.videoPath

        // Don't fuck with the following values. iOS needs these
        width: parent.width*11/12
        height: parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/20
    }



    VideoBar {
        id: videoController
        progressBarPecent: taskVideo.position*100/taskVideo.duration
        movieLength: taskVideo.duration

        anchors.bottom: menuButton.top

        onPlayClicked: {
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

