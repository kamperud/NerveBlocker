import QtQuick 2.0



Rectangle {
    property alias labelText: label.text
    property alias contentText: content.text

    id: pointsBox
    color: "#f7e967"
    radius: height/4

    Text {
        id: label
        text: qsTr("POINTS")
        font.family: ubuntu.name
        font.pixelSize: parent.height/3
        
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
    }
    
    Text {
        id: content
        text: gamehandler.points
        font.pixelSize: parent.height/1.5
        font.family: scoreFont.name
        
        anchors.bottom: parent.bottom
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.left: parent.left
    }
}
