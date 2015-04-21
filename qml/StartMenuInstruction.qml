import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    signal backButtonClicked()

    color: backgroundGrey
    // TODO, add buffering animation

    Text {
        id: title
        text: "An introduction to\n FEMORAL NERVE BLOCKS"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/15

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/20
    }


    Video {
        id: taskVideo
        autoPlay: true

        // short clip
        source: "http://folk.ntnu.no/solvehel/instructional.mp4"

        // Don't fuck with the following values. iOS needs these
        width: parent.width*11/12
        height: parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/20
        onPaused:{
            videoController.playVisible = true;
        }
        onPlaying:{
            videoController.playVisible = false;
        }
    }
    VideoBar {
        id: videoController       
        progressBarPecent: taskVideo.position*100/taskVideo.duration
        movieLength: taskVideo.duration

        anchors.bottom: menuButton.top
        anchors.bottomMargin: parent.height/40

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
        width:parent.width*11/12
        anchors.horizontalCenter: parent.horizontalCenter

        onMenuClicked: {
            taskVideo.stop();
            backButtonClicked();;
        }
    }

}

