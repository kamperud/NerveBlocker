import QtQuick 2.0

Rectangle {
    width: 300
    height: 500

    color: "#222222"



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
            //font.pixelSize: 300/8
            //font.capitalization: Font.AllUppercase

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
        }
    }

/*
    GameMenuButton{
        id: easyButton
        text: qsTr("Easy")

        anchors.verticalCenter: parent.horizontalCenter/2
        anchors.horizontalCenter: parent.verticalCenter
    }

    GameMenuButton{
        id: normalButton
        text: qsTr("Normal")

        anchors.horizontalCenter: parent.verticalCenter
        anchors.verticalCenter: parent.horizontalCenter
    }

    GameMenuButton{
        id: expertButton
        text: qsTr("Expert")

        anchors.verticalCenter: (parent.horizontalCenter / 2) * 3
        anchors.horizontalCenter: parent.verticalCenter
    }
*/
}
