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
        anchors.bottom: taskVideo.top
        height: parent.height - taskVideo.height;

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

        source: "http://folk.ntnu.no/solvehel/FL_Acq04_2DFrames_RGB_v1.mp4"

        //width: parent.width*11/12
        //height: parent.height
        width: metaData.resolution ? metaData.resolution.width : parent.width*11/12
        height: metaData.resolution ? metaData.resolution.height : parent.height/2


        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: videoController.top
    }

    VideoBar {
        id: videoController
        width: parent.width
        height: parent.height/8
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: menuButton.top

        progressBarPecent: taskVideo.position*100/taskVideo.duration
        movieLength: taskVideo.duration
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
        onMenuClicked: {
            gameMenuClicked();
        }
    }

    NextButton {
        id: nextButton
        arrowVisible: false

    }
}

