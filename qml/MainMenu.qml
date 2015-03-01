import QtQuick 2.0

Rectangle {
    signal beginnerClicked()
    signal timedClicked()
    signal tutorialClicked()
    signal videoClicked()
    signal instructionalClicked()
    signal annotationClicked()

    id: gameMenu
    width: 300
    height: 500
    color: "#222222"

    GameMenuExtraButton{
        id: instructionalVideoButton
        text: ""

        Text{

            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/10
            anchors.topMargin: parent.height/5

            color: "black"
            text: qsTr("Instructional")

            font.family: ubuntu.name
            font.pixelSize: parent.width/12
            font.capitalization: Font.AllUppercase

            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter

        }
        Text{
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/5
            anchors.topMargin: parent.height/10

            color: "#000000"
            text: qsTr("Video")

            font.family: ubuntu.name
            font.pixelSize: parent.width/8
            font.capitalization: Font.AllUppercase

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter

        }

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 3.5

        anchors.left: parent.left
        anchors.leftMargin: parent.width * 2 / 21

        onClicked: {
            instructionalClicked();
        }
    }

    GameMenuExtraButton{
        id: downloadsButton
        text: qsTr("Downloads")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 3.5

        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2 / 21
    }

    GameMenuPlayButton{
        id: easyButton
        text: qsTr("Easy")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 10

        anchors.left: parent.left

        anchors.leftMargin: parent.width * 2 / 21
        anchors.rightMargin: parent.width / 21

        onClicked: {
            tutorialClicked();
        }
    }

    GameMenuPlayButton{
        id: normalButton
        text: qsTr("Normal")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 10

        anchors.left: easyButton.right
        anchors.right: expertButton.left

        anchors.leftMargin: parent.width / 21
        anchors.rightMargin: parent.width / 21

        onClicked: {
            beginnerClicked();
        }

    }


    GameMenuPlayButton{
        id: expertButton
        text: qsTr("Expert")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 10

        anchors.right: parent.right

        anchors.leftMargin: parent.width / 21
        anchors.rightMargin: parent.width * 2 / 21

        onClicked: {
            timedClicked();
        }
    }

    GameMenuPlayButton{
        id: videoButton
        text: qsTr("Video")

        fontSize: parent.width/12

        radius: 10

        height: (parent.width * 3) / 16
        width: (parent.width * 10) / 16

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        anchors.verticalCenterOffset: parent.height / 10

        onClicked: {
            videoClicked();
        }
    }

    GameMenuPlayButton{
        id: annotationButton
        text: qsTr("Annotation")

        fontSize: parent.width/12

        radius: 10

        height: (parent.width * 3) / 16
        width: (parent.width * 10) / 16

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        anchors.verticalCenterOffset: parent.height / 4

        onClicked: {
            annotationClicked();
        }
    }
}
