import QtQuick 2.0

Rectangle {
    id: gameInfo
    width: 300
    height: 450
    color: "#ffffff"

    Image {
        id: infoImage
        anchors.verticalCenter: parent.verticalCenter
//        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        height: (parent.width>parent.height) ? parent.height : sourceSize.height*parent.width/sourceSize.width
        width:  (parent.width<parent.height) ? parent.width : sourceSize.width*parent.height/sourceSize.height

        source: "gameImages/1.png"
        fillMode: Image.PreserveAspectFit
        visible: true
    }

}
