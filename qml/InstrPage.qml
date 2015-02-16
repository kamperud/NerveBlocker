import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id: rectangle1
    signal backButtonClicked()
    width: 350
    height: 500
    color: "#222222"

    //TODO if video not ready, do something samrt in the mean time

    Text {
        id: warning
        text: "This video streams\n from the internet\n and may cost you\n money"


        color: "#f7e967"
        font.family: ubuntu.name
        font.pixelSize: parent.width/10

        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/15

    }
    GameModeButton {
        text: "PLAY"
        color: "#333333"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Timer  {
            id: timer
            interval: 5000
            running: false
            repeat: false

            onTriggered: taskVideo.play();


        }
        onClicked: {
            // starts the loading loading
            taskVideo.pause();
            // a small delay before playing the video
            timer.start();

            visible = false;
            warning.visible = false;
            videoController.visible = true;


        }
    }

    Video {
        id: taskVideo
        autoPlay: false
        autoLoad: false

        // short clip
        //source: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4"
        // long clip
        source: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"

        width: parent.width*11/12
        height: width*10/16

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/6
    }
    VideoBar {
        id: videoController
        visible: false
        anchors.top: taskVideo.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onPlayClicked: {
            if (taskVideo.playbackState===MediaPlayer.PlayingState) {
                taskVideo.pause();
            }
            else {
                taskVideo.play();
            }
        }

    }



    GameModeButton{
        text: "BACK"
        height: parent.height/6
        radius: 0

        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        onClicked:{
            taskVideo.stop();
            backButtonClicked();
        }

    }



}

