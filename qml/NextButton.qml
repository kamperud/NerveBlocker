import QtQuick 2.0
import UllApp 1.0;

Rectangle {
    id: botNext
    signal nextClicked()
    property alias arrowVisible: arrow.visible
    
    width: parent.width*4.5/12
    height: parent.height/10
    color: nextButton.pressed ? "#1fdada" : "#04bfbf"
    radius: height/4
    anchors.right: parent.right
    anchors.rightMargin: parent.width/12
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.width/20
    
    Image {
        id: arrow
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "icons/arrow-19-512.png"
        visible: false
    }
    
    Text{
        id: confirmButton
        color: "#ffffff"
        text: qsTr("CONFIRM")
        font.family: ubuntu.name
        font.pixelSize: parent.height/2.5
        visible: !arrow.visible
        
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
    }
    
    MouseArea {
        id: nextButton
        anchors.fill: parent
        onClicked: nextClicked()

    }
}
