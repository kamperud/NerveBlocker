import QtQuick 2.0

Item{
    signal buttonClicked()
    width: parent.width/5
    height: width

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClicked()
    }
}

