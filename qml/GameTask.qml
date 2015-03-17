import QtQuick 2.0
import QtQuick.Controls 1.2
import UllApp 1.0

Item {
    property var task

    property alias progressBarInterval: animation.duration
    property alias progressBarWidth: yellowBar.width
    property alias progressBarRunning: seqAnimation.running
    property alias progressBarStarterWidth: greyBar.width
    property alias croXvisible: crox.visible
    property alias animation: animation
    property alias seqAnimation: seqAnimation
    property alias taskImageSizeWidth: taskImage.sourceSize.width
    property alias taskImageSizeHeight: taskImage.sourceSize.height


    function getOrganColor(organ) {
        switch(organ){
        case Organ.FEMUR:
            return "green";
        case Organ.ARTERY:
            return "red";
        case Organ.ILIACA:
            return "magenta";
        case Organ.LATA:
            return "turquoise";
        case Organ.NERVE:
            return "yellow";
        default:
            return "Unknown";
        }
    }

    //Task text
    TaskText {
        id: textArea
    }


    //Yellow progress bar
    Rectangle {
        id: yellowBar
        width: taskImage.width //progressBarWidth
        height: taskImage.height/20
        color: "#f7e967"
        visible: gamehandler.game.mode === Mode.TIMED

        z: 1
        x: taskImage.x
        anchors.bottom: taskImage.top

        SequentialAnimation {
            id: seqAnimation
            running: true //progressBarRunning

            PropertyAnimation {
                duration: 50
            }

            PropertyAnimation {
                id: animation;
                target: yellowBar;
                property: "width";
                to: 1;
                duration: 5000 //progressBarInterval
            }
        }
    }

    //Grey progress bar
    Rectangle {
        id: greyBar
        width: taskImage.width //progressBarStarterWidth
        height: taskImage.height/20
        color: "#666666"
        visible: gamehandler.game.mode === Mode.TIMED

        x: taskImage.x
        anchors.bottom: taskImage.top
    }


    Image {
        id: taskImage
        width: parent.width*11/12
        height: sourceSize.height*width/sourceSize.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width/20
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectFit
        source: task.image.imagePath

        //Cross
        Image {
            id: crox
            z: 2
            x: 0
            y: 0
            width: parent.width/10
            height: width
            visible: false
            source: "icons/cancel-50.png"
        }

        //Mapped image
        Image{
            id:mappedImage
            anchors.fill: parent
            z: 1
            source: task.image.mappedImagePath
            visible: gamehandler.game.mode === Mode.TUTORIAL || task.answered
        }


        MouseArea {
            id: imageArea
            anchors.fill: parent
            visible: gamehandler.game.mode !== Mode.DRAG
            onClicked: {
                //Show cross on image
                if(!taskConfirmed) {
                    crox.x = mouse.x - crox.width/2;
                    crox.y = mouse.y - crox.width/2;
                    unscaledX = taskImage.sourceSize.width*mouse.x/width;
                    unscaledY = taskImage.sourceSize.height*mouse.y/height;
                    taskXSet = true;
                    crox.visible = true;
                }
            }
        }
    }
}

