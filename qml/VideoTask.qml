import QtQuick 2.0
import QtMultimedia 5.4
import UllApp 1.0;


Rectangle {
    signal menuClicked()
    signal videoRestarted()
    signal tempVideoPaused()
    color: "#222222"

    Text {
        id: title
        text: "Watch the Video"
        horizontalAlignment: Text.AlignHCenter
        color: "#ffffff"
        font.family: ubuntu.name
        font.pixelSize: parent.width/15

        anchors.top: parent.top
        anchors.topMargin: parent.height/10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Video {
        id: taskVideo
        autoPlay: true

        // short clip
        source: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4"
        // long clip
        //source: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"

        width: parent.width*11/12
        height: width*3/4


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/10
    }

    VideoBar {
        id: videoController
        anchors.top: taskVideo.bottom
        circleVisible: false
        width: parent.width
        height: parent.height/4
        anchors.horizontalCenter: parent.horizontalCenter

        progressBarPecent: taskVideo.position*100/taskVideo.duration
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
            taskVideo.seek(taskVideo.position+circleDistance*taskVideo.duration);
        }
    }

    MenuButton {
        id: botMenu

        width: taskVideo.width
        anchors.horizontalCenter: parent.horizontalCenter

        onMenuClicked: {
            menuClicked();
        }
    }
}

