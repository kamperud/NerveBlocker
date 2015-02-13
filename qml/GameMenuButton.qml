import QtQuick 2.0

Rectangle {
    id: button
    property alias text: buttonText.text
    color: "#04bfbf"
    radius: 15

    //width: parent.width*3/4
    width: 300 * 3 / 4
    height: width/3

    Text {
        id: buttonText
        color: "#ffffff"
        text: qsTr("TODO")
        //font.family: ubuntu.name
        //font.pixelSize: parent.width/8
        font.pixelSize: 300/8
        font.capitalization: Font.AllUppercase

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }
}

