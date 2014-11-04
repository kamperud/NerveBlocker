import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2


Rectangle {
    id: gameWrapper
    x: 0
    y: 0
    //anchors.fill: parent
    color: "#222222"

    Rectangle {
        id: topPoints
        color: "#f7e967"
        radius: 15
        width: parent.width*4.5/12
        height: parent.width/5.5
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.top: parent.top
        anchors.topMargin: parent.width/20

        Text {
            id: text1
            height: 19
            text: qsTr("POINTS")
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
        }

        Text {
            id: text2
            y: 17
            text: qsTr("2431")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 30
        }
    }

    Rectangle {
        id: topMulti
        color: "#f7e967"
        radius: 15
        width: parent.width*4.5/12
        height: parent.width/5.5
        anchors.top: parent.top
        anchors.topMargin: parent.width/20
        anchors.right: parent.right
        anchors.rightMargin: parent.width/12

        Text {
            id: text4
            x: -162
            y: 440
            text: qsTr("x4")
            anchors.leftMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 0
            font.pixelSize: 30
            anchors.rightMargin: 0
        }

        Text {
            id: text3
            x: 22
            y: 19
            height: 19
            text: qsTr("MULTIPLIER")
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 18
            anchors.rightMargin: 0
        }

    }

    Rectangle {
        id: botMenu
        width: parent.width*4.5/12
        height: parent.width/5.5
        color: "#04bfbf"
        radius: 15
        anchors.left: parent.left
        anchors.leftMargin: parent.width/12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width/20

        Text {
            id: text6
            color: "#ffffff"
            text: qsTr("MENU")
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 25
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
    }

    Rectangle {
        id: botNext
        width: parent.width*4.5/12
        height: parent.width/5.5
        color: "#04bfbf"
        radius: 15
        anchors.right: parent.right
        anchors.rightMargin: parent.width/12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width/20

        Image {
            id: image1
            fillMode: Image.PreserveAspectFit
            anchors.fill: parent
            source: "arrow-19-512.png"
        }

        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
    }




    Image {
        id: gameImage
        x: 0
        y: 172
        width: parent.width*11/12
        anchors.bottom: botMenu.top
        anchors.bottomMargin: parent.width/20
        anchors.horizontalCenter: parent.horizontalCenter


        fillMode: Image.PreserveAspectFit
        source: "gameImages/13a.png"
    }
    Text {
        id: text5
        y: 115
        height: 43
        color: "#ffffff"
        text: qsTr("FEMORAL NERVE")
        anchors.bottom: gameImage.top
        anchors.bottomMargin: 9
        font.bold: true
        font.family: "Verdana"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pixelSize: 26
    }
    Text {
        id: text7
        y: 83
        height: 17
        color: "#ffffff"
        text: qsTr("Touch the")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: text5.top
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pixelSize: 20
    }
}
