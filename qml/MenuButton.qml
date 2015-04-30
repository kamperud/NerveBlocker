import QtQuick 2.0
import UllApp 1.0;

// Disse har jeg fjernet fordi jeg
// mistenker at de ikke gjoer noe
// De bruker mye plass hvis de faar vaere her

//import QtQuick.Layouts 1.1
//import QtQuick.Controls 1.2
//import QtQml 2.2


Rectangle {
    id: botMenu
    signal menuClicked()

    anchors.left: parent.left
    anchors.leftMargin: parent.width/12
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.width/20

    width: parent.width*4.5/12
    height: main.height/main.width<1.5 ? parent.height/13 : parent.height/10
    color: menuButton.pressed ? "#1fdada" : "#04bfbf"
    radius: height/4

    Text {
        color: "#ffffff"
        text: qsTr("MENU")
        font.family: ubuntu.name
        font.pixelSize: parent.height/2.5
        
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
    }
    
    MouseArea {
        id: menuButton
        anchors.fill: parent
        onClicked: {
            menuClicked();
        }
    }
}
