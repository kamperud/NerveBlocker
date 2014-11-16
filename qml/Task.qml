import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import UllApp 1.0;


Item {
    property var task
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

    Item {
        id: textArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: taskImage.top
        height: parent.height - taskImage.height;

        Text {
            color: "#ffffff"
            text: qsTr("Touch the")
            font.family: ubuntu.name
            font.pixelSize:parent.height/5

            visible: !task.answered

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -question2.font.pixelSize
            anchors.right: parent.right
            anchors.left: parent.left
        }

        Text {
            id: question2
            font.bold: true
            font.pixelSize: parent.height/4
            font.family: ubuntu.name
            font.capitalization: Font.AllUppercase

            visible: !task.answered
            text: getOrganName(gamehandler.game.currentTask.organ)
            color: "white"

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: feedback
            font.bold: true
            font.pixelSize: parent.height/3
            font.family: ubuntu.name
            font.capitalization: Font.AllUppercase

            visible: task.answered
            text: task.correct ? "Correct" : "Wrong"
            color: task.correct ? "#a9e7ba" : "red"

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.verticalCenterOffset: -parent.height/10
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: helperText
            color: getOrganColor(task.organ)
            text: qsTr("It's the ") + getOrganColor(task.organ) + " one"
            font.family: ubuntu.name
            font.pixelSize:parent.height/5

            visible: (gamehandler.game.mode === Mode.TUTORIAL
                      || task.answered && !task.correct && gamehandler.game.mode != Mode.TIMED)
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter

            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }

    Rectangle {
        width: taskImage.width/2
        height: taskImage.height/20
        color: "#f7e967"
        visible: gamehandler.game.mode === Mode.TIMED

        z: 1
        x: taskImage.x
        anchors.bottom: taskImage.top
    }

    Rectangle {
        width: taskImage.width
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
        source: (gamehandler.game.mode === Mode.TUTORIAL || task.answered ?
                task.image.annotatedImagePath
                : task.image.imagePath)

        Image {
            id: crox
            z: 1
            x: 0
            y: 0
            width: parent.width/10
            height: width
            visible: gamehandler.game.currentTask.answered
            source: "icons/cancel-50.png"
        }

        MouseArea {
            id: imageArea
            anchors.fill: parent
            onClicked: {
                if(task.answered)return;
                crox.x = mouse.x - crox.width/2;
                crox.y = mouse.y - crox.width/2;
                var unscaledX = taskImage.sourceSize.width*mouse.x/width;
                var unscaledY = taskImage.sourceSize.height*mouse.y/height;
                gamehandler.game.currentTask.answerTask(unscaledX, unscaledY);
            }
        }
    }
}
