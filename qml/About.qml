import QtQuick 2.3

Rectangle {
    id: topRec
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
        id: introText
        text: "This app is the result of a master's\
         \nproject developed at the Norwegian University \
         \nof Science and Technology (NTNU) in collaboration\
         \nwith SINTEF. It is provided free of charge for\
         \nthe purpose of education."
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/25

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: qtLicense.top
        anchors.bottomMargin: topRec.height/20
    }
    Text{
        id: qtLicense
        text: "This software was developed using Qt\n under the LGPLv3 license"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/25

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: icons.top
        anchors.bottomMargin: topRec.height/20
    }
    Text{
        id: icons
        text: "The icons used come from www.icons8.com"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/25

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    Text{
        id: github
        text: "The source code can be found at \
        \nwww.github.com/blackCheetah/RegAnesthAppMSc"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/25

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: icons.bottom
        anchors.topMargin: topRec.height/20
    }

    Text{
        id: sincerely
        text: "Sincerely,\
        \nSolveig Hellan\
        \nand\
        \nHanna Holler Kamperud"
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        font.family: ubuntu.name
        font.pixelSize: parent.width/35

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: github.bottom
        anchors.topMargin: topRec.height/20
    }

    MenuButton {
        id: menuButton
        width:parent.width*11/12
        anchors.horizontalCenter: parent.horizontalCenter

        onMenuClicked: {
            backButtonClicked();;
        }
    }
}

