import QtQuick 2.0


Item {
    id: item1
    signal playClicked()
    width: parent.width/2

    PlayerButton{
        id: playPause
        anchors.horizontalCenter: parent.horizontalCenter
        onButtonClicked:{
            playClicked();
            playIcon.visible = !playIcon.visible;
        }
        Image {
            id: playIcon
            source: "icons/play_128x128.png"
            anchors.fill: parent
            visible: false
        }
        Image {
            source: "icons/pause_128x128.png"
            anchors.fill: parent
            visible: !playIcon.visible
        }
    }



}


