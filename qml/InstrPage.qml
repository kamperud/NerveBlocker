import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id: outline
    signal backButtonClicked()

    color: "#222222"

    //TODO if video not ready, do something samrt in the mean time

    Image {
        id: backButton
        source: "icons/Left4-50.png"
        width: parent.width/10
        height: width
        fillMode: Image.PreserveAspectFit

        //anchors.leftMargin: width/20
        anchors.topMargin: width/5
        anchors.top: parent.top
        x: taskVideo.x-width/4

        MouseArea {
            anchors.fill: parent
            onClicked: {
                taskVideo.stop();
                backButtonClicked();
            }
        }
    }

    Text {
        id: warning
        text: "This video streams\n from the internet\n and may cost you\n money"
        color: "#f7e967"
        font.family: ubuntu.name
        font.pixelSize: parent.width/10
        visible: outline.state !== "playing"

        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: backButton.bottom
        anchors.topMargin: parent.height/10

    }
    GameModeButton {
        id: startLoadingButton
        text: "START"
        color: "#333333"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: warning.bottom
        anchors.topMargin: parent.height/10
        visible: outline.state !== "playing"

        onClicked: {
            // starts the loading
            taskVideo.pause();
            // a small delay before playing the video
            timer.start();
            outline.state = "playing";
        }

        Timer  {
            id: timer
            interval: 5000
            running: false
            repeat: false
            onTriggered: taskVideo.play();
        }
    }

    Text {
        id: title
        text: "An introduction to\n FEMORAL NERVE BLOCKS"
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        font.family: ubuntu.name
        font.pixelSize: parent.width/15
        visible: outline.state === "playing"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: backButton.bottom
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
        height: width*3/4
        visible: outline.state === "playing"


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    VideoBar {
        id: videoController
        visible: outline.state === "playing"
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
}

