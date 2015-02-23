import QtQuick 2.0
import QtMultimedia 5.4

//import QtQuick.Layouts 1.1
//import QtQuick.Controls 1.2
//import QtQml 2.2
import UllApp 1.0;


Rectangle {
    signal backButtonClicked()
    signal videoRestarted()
    signal tempVideoPaused()


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
        source: "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4"
        // long clip
        //source: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"

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




}

