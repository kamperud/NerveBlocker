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
        text: "This video streams from the internet\n and may cost you money"


        color: "#f7e967"
        font.family: ubuntu.name
        font.pixelSize: parent.width/20

        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/20

    }

    Video {
        id: taskVideo
        //autoPlay: true
        autoPlay: false
        autoLoad: false

        // short clip
        source: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4"
        // long clip
        //source: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"

        width: parent.width*11/12
        height: parent.width*11/12


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/6
    }
    GameModeButton {
        text: "PLAY"
        z: 1
        color: "#222222"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/6

        Timer  {
            id: timer
            interval: 5000
            running: false
            repeat: false
            onTriggered: taskVideo.play();

        }
        onClicked: {
            taskVideo.play();
            taskVideo.pause();
            // a small delay before playing the video
            timer.start();

            visible = false;
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
            taskVideo.pause();

            backButtonClicked();
        }

    }



}

