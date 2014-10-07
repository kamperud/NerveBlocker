import QtQuick 2.0

Rectangle {
    id: gameWrapper
    x: 0
    y: 0
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    color: "#000000"

    MouseArea{
        anchors.fill: gameImage
        onPressed: gameImage.source = "gameImages/1a.png"
        onReleased: gameImage.source = "gameImages/1.png"
    }

    Image {
        id: gameImage
        anchors.verticalCenter: parent.verticalCenter
        source: "gameImages/1.png"
        anchors.right: parent.right
        anchors.left: parent.left
        fillMode: Image.PreserveAspectFit
        visible: true


    }
}
