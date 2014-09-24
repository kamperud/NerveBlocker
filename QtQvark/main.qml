import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 640
    height: 480
    title: qsTr("Hallo pus <3")
    color: "#ffffff"

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }


    ListView {
        id: mainMenu
        anchors.fill: parent


        HannaButtonS {
            id: hannaButton1
            x: -150
            y: 117
            text: qsTr("GAME")
            anchors.top: hannaButton2.bottom
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
        }

        HannaButtonS {
            id: hannaButton2
            x: -150
            y: 57
            text: qsTr("ARCHIVE")
            anchors.top: parent.top
            anchors.topMargin: 135
            anchors.rightMargin: 0
            anchors.leftMargin: 0
        }
    }

}

