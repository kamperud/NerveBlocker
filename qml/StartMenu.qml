import QtQuick 2.0

Rectangle {
    signal beginnerClicked()
    signal timedClicked()
    signal tutorialClicked()
    signal videoClicked()
    signal instructionalClicked()
    signal annotationClicked()

    id: gameMenu
    /*
    width: 300
    height: 500
    */
    color: backgroundGrey

    Item {
        id: title
        anchors.bottom: instructionalVideoButton.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        Text {
            color: "white"
            text: "An overview of the"
            font.pixelSize: parent.width/25
            font.family: ubuntu.name

            anchors.verticalCenterOffset: -parent.height/9
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            color: "white"
            text: "FEMORAL NERVE BLOCK"
            font.pixelSize: parent.width/22
            font.family: ubuntu.name

            anchors.verticalCenterOffset: parent.height/11
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }
    }

    StartMenuExtraButton{
        id: instructionalVideoButton
        text: ""

        Text{

            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/5
            anchors.topMargin: parent.height/10

            color: "black"
            text: qsTr("Instructional")

            font.family: ubuntu.name
            font.pixelSize: parent.width/15
            font.capitalization: Font.AllUppercase

            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter

        }
        Text{
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/10
            anchors.topMargin: parent.height/5

            color: "black"
            text: qsTr("Video")

            font.family: ubuntu.name
            font.pixelSize: parent.width/10
            font.capitalization: Font.AllUppercase

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter

        }


        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 3.5


        anchors.left: parent.left
        anchors.leftMargin: parent.width * 4/21
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 4/21

        onClicked: {
            instructionalClicked();
        }
    }

    Text {
        text: qsTr("Practice your skills\n with the GAME MODES below")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width/25
        color: "white"
        font.family: ubuntu.name


        anchors.bottom: easyButton.top
        anchors.top: instructionalVideoButton.bottom
        anchors.right: parent.right
        anchors.left: parent.left
    }

    StartMenuPlayButton{
        id: easyButton
        text: qsTr("Easy")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 25

        anchors.left: parent.left

        anchors.leftMargin: parent.width * 2 / 21
        anchors.rightMargin: parent.width / 21

        onClicked: {
            tutorialClicked();
        }
    }

    StartMenuPlayButton{
        id: normalButton
        text: qsTr("Normal")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 25

        anchors.left: easyButton.right
        anchors.right: expertButton.left

        anchors.leftMargin: parent.width / 21
        anchors.rightMargin: parent.width / 21

        onClicked: {
            beginnerClicked();
        }

    }


    StartMenuPlayButton{
        id: expertButton
        text: qsTr("Expert")

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -parent.height / 25
        anchors.right: parent.right
        anchors.leftMargin: parent.width / 21
        anchors.rightMargin: parent.width * 2 / 21

        onClicked: {
            timedClicked();
        }
    }

    StartMenuPlayButton{
        id: videoButton
        text: qsTr("Video")

        fontSize: parent.width/12
        height: (parent.width * 3) / 16
        width: (parent.width * 10) / 16

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height / 7

        onClicked: {
            videoClicked();
        }
    }

    StartMenuPlayButton{
        id: annotationButton
        text: qsTr("Annotation")

        fontSize: parent.width/12

        height: (parent.width * 3) / 16
        width: (parent.width * 10) / 16

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        anchors.verticalCenterOffset: parent.height / 3.3

        onClicked: {
            annotationClicked();
        }
    }

}
