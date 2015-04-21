import QtQuick 2.0

Rectangle {
    id: button
    signal clicked()
    property alias text: buttonText.text
    color: mouseArea.pressed ? "#fffd89" : "#f7e967"

    radius: parent.width/50

    width: (parent.width * 8 ) / 21
    height: parent.height / 11

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            button.clicked();
        }
    }

    Text {
        id: buttonText
        color: "#000000"
        text: qsTr("TODO")

        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        font.family: ubuntu.name
        font.pixelSize: parent.width/8
        font.capitalization: Font.AllUppercase

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }

}

