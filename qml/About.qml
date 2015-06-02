import QtQuick 2.3

Rectangle {
    signal backButtonClicked()
    color: backgroundGrey

    Text {
        id: title
        text: "ABOUT"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/18

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/20
    }
    Text{
        text: "This app is the result of a master's\
         project developed at the Norwegian University \
         of Science and Technology(NTNU) in collaboration\
         with SINTEF. It is provided free of charge for\
         the purpose of education."
    }
    Text{
        text: "This software was developed using Qt under the LGPLv3 license"
    }
    Text{
        text: "This software was developed using Qt under the LGPLv3 license"
    }

    MenuButton {
        id: menuButton
        width:parent.width*11/12
        anchors.horizontalCenter: parent.horizontalCenter

        onMenuClicked: {
            taskVideo.stop();
            backButtonClicked();;
        }
    }
}

