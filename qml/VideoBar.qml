import QtQuick 2.0
import UllApp 1.0


Item {
    id: item
    signal playClicked()
    signal progressClicked()
    property real progressBarPecent: 1
    property real circleDistance: 1
    property alias playVisible: playIcon.visible
    property int movieLength: 1000
    property var positions: [50, 200];

    width: parent.width
    height: parent.height/8
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: blueBar
        width: greyBar.width*item.progressBarPecent/100
        height: parent.height/5
        color: blueMain
        radius: 3
        z: 1
        x: greyBar.x

        anchors.top: parent.top



        Rectangle {
            id: circle
            color: "grey"
            border.color: "#494949"
            border.width: 2

            radius: width/2
            height: parent.height*2
            width: height

            anchors.verticalCenter: parent.verticalCenter
            x: /*progressArea.drag.active ? circle.x :*/ blueBar.width - width/2
            Rectangle {
                color: blueMain
                border.color: "#494949"
                border.width: 2

                radius: width/2
                height: parent.height/2
                width: height

                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
    }
    Rectangle {
        id: greyBar
        width: parent.width*11/12
        height: parent.height/5
        color: "grey"
        radius: 3

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }

    MouseArea {
        id: progressArea
        visible: circle.visible
        anchors.fill: greyBar
        drag.target: circle
        drag.maximumX: greyBar.width -circle.width/2
        drag.minimumX: -circle.width/2
        drag.axis: Drag.XAxis
        onPositionChanged:  {
             if (drag.active && gamehandler.game.mode===Mode.VIDEO)
                 updatePosition(mouse)
        }
        onReleased: {
             updatePosition(mouse)
        }
        function updatePosition(mouse) {
            var x = mouse.x;
            if (x>drag.maximumX) {
                x = drag.maximumX;
            }
            else if (x < drag.minimumX){
                x = drag.minimumX;
            }
            circleDistance = (x+circle.width/2)/greyBar.width;
            progressClicked();
        }
    }

    Item{
        id: playPause

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: playClicked()

        }

        width: parent.height/2
        height: width

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: greyBar.bottom
        anchors.topMargin: height/3

        Image {
            id: playIcon
            source: "icons/Play-50.png"
            anchors.fill: parent
            visible: false
        }
        Image {
            source: "icons/Pause-50.png"
            anchors.fill: parent
            visible: !playIcon.visible
        }
    }

}


