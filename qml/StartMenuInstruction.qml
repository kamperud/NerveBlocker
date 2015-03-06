import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    signal backButtonClicked()

    color: backgroundGrey
    // TODO, add buffering animation

    Image {
        id: backButton
        source: "icons/Left4-50.png"
        width: parent.width/10
        height: width
        fillMode: Image.PreserveAspectFit

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
        id: title
        text: "An introduction to\n FEMORAL NERVE BLOCKS"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/15

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: backButton.bottom
    }


    Video {
        id: taskVideo
        autoPlay: true

        // short clip
        source: "http://folk.ntnu.no/solvehel/instructional.mp4"
        // long clip
        //source: "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_30fps_normal.mp4"

        width: parent.width*11/12
        height: width*3/4

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    VideoBar {
        id: videoController
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

