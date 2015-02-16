import QtQuick 2.0

Rectangle{
    signal buttonClicked()
    width: parent.width/5
    height: width
    radius: 5
    color: mouseArea.pressed ? yellowLight : yellowMain

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClicked()
    }
}

