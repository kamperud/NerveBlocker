import QtQuick 2.0

Rectangle {
    signal beginnerClicked()
    signal timedClicked()
    width: 300
    height: 500
    color: "#222222"

    Text {
        color: "#f7e967"
        text: "THE NERVES OF \nSOME PEOPLE"
        horizontalAlignment: Text.AlignHCenter
        font.family: ubuntu.name
        font.pixelSize: parent.width/11
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/3
    }

    GameModeButton {
        text: qsTr("Beginner")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/7
        anchors.verticalCenter: parent.verticalCenter
        onClicked: {
            beginnerClicked();
        }

    }

    GameModeButton {
        text: qsTr("Timed")
        anchors.verticalCenterOffset: parent.height/20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            timedClicked();
        }
    }

    Rectangle {
        id: infoButton
        color: infoArea.pressed ? "#fff987" : "#f7e967"
        radius: 10

        width: parent.width/4
        height: width/2

        anchors.verticalCenterOffset: parent.height/4
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: infoArea
            anchors.fill: parent
//            onClicked: mainArea.state = "infoGame"
        }

        Text {
            color: "#000000"
            text: qsTr("INFO")
            font.family: ubuntu.name
            font.pixelSize: parent.width/5
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
        }
    }

}
