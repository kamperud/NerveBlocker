import QtQuick 2.0

Rectangle {
    id: button
    signal clicked()
    property alias text: buttonText.text
    color: mouseArea.pressed ? "#1fdada" : "#04bfbf"
    radius: 15
    
    width: parent.width*3/4
    height: width/3

    MouseArea {
        id: mouseArea
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        onClicked: {
            button.clicked();
        }
    }

    Text {
        id: buttonText
        color: "#ffffff"
        text: qsTr("TODO")
        font.family: ubuntu.name
        font.pixelSize: parent.width/8
        font.capitalization: Font.AllUppercase

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }
}
