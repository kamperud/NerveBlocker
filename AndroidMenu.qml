import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2

MenuBar {
    Menu {
//        visible: !sys.isIos
        title: qsTr("File")
        MenuItem {
            text: qsTr("Log In")
            onTriggered: Qt.quit();
        }
        MenuItem {
            text: qsTr("Exit")
            onTriggered: Qt.quit();
        }

        MenuItem {
            text: qsTr("Game Info")
            onTriggered: Qt.quit();
        }

    }
}
