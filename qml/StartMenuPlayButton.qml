import QtQuick 2.0

Rectangle {
    id: button
    signal clicked()
    property alias text: buttonText.text
    property alias fontSize: buttonText.font.pixelSize
    color: mouseArea.pressed ? "#1fdada" : "#04bfbf"


    radius: parent.width/40

    width: (parent.width * 5)/ 21
    height: (parent.width * 5)/ 21

    MouseArea {
        id: mouseArea
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
        font.pixelSize: parent.width/5
        font.capitalization: Font.AllUppercase

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }
}

