import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    signal backButtonClicked()

    color: backgroundGrey
    // TODO, add buffering animation

    /*Image {
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
    }*/


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
    }
    VideoBar {
        id: videoController
        width: parent.width
        height: parent.height/8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: menuButton.top
        anchors.bottomMargin: parent.height/40

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
        id: menuButton
        width:parent.width*11/12
        anchors.horizontalCenter: parent.horizontalCenter

        onMenuClicked: {
            taskVideo.stop();
            backButtonClicked();;
        }
    }

}

