import QtQuick 2.0

Rectangle {
    signal beginnerClicked()
    signal timedClicked()
    signal tutorialClicked()
    signal videoClicked()
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
        id: tutorialButton
        text: qsTr("Tutorial")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -parent.height/7
        anchors.verticalCenter: parent.verticalCenter
        onClicked: {
            tutorialClicked();
        }

    }

    GameModeButton {
        id: normalButton
        text: qsTr("Normal")
        anchors.top: tutorialButton.bottom
        anchors.topMargin: parent.height/50
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            beginnerClicked();
        }
    }
    GameModeButton {
        id: timedButton
        text: qsTr("Timed")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: normalButton.bottom
        anchors.topMargin: parent.height/50
        onClicked: {
            timedClicked();
        }
    }
    GameModeButton {
        id: videoButton
        text: qsTr("Video")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: timedButton.bottom
        anchors.topMargin: parent.height/50
        onClicked: {
            videoClicked();
        }
    }

}
