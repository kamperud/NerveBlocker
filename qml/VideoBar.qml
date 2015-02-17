import QtQuick 2.0


Item {
    id: item
    signal playClicked()
    signal progressClicked()
    property real progressBarPecent: 1
    width: parent.width/2

    Rectangle {
        id: blueBar
        width: greyBar.width*item.progressBarPecent/100
        height: parent.height/10
        color: blueMain
        radius: 3
        z: 1
        x: greyBar.x

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height/5

        Rectangle {
            id: circle
            color: "grey"
            border.color: "#494949"
            border.width: 2

            radius: 18
            height: parent.height*2
            width: height

            anchors.verticalCenter: parent.verticalCenter
            x: blueBar.width - width/2
            Rectangle {
                color: blueMain
                border.color: "#494949"
                border.width: 2

                radius: 9
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
        height: parent.height/8
        color: "grey"
        radius: 3

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/5
    }

    /*MouseArea {
        anchors.fill: greyBar
        onClicked: progressClicked()
        drag.target: circle
        drag.maximumX: greyBar.width+greyBar.x
        drag.minimumX: greyBar.x
        drag.minimumY:

    }*/


    PlayerButton{
        id: playPause

        width: parent.width/10
        height: width

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: parent.height/5

        onButtonClicked:{
            playClicked();
            playIcon.visible = !playIcon.visible;
        }
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


