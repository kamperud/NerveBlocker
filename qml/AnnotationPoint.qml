import QtQuick 2.0

Rectangle{
    signal dragActive()
    property alias mouse: mouseArea
    property point center: Qt.point(x + width/2, y+height/2)
    id: annotationPoint
    width: parent.width/20
    height: width
    color: backgroundGrey
    radius: width/2
    border.color: "white"
    border.width: width/7
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -parent.width
        drag.target: parent
        drag.axis: Drag.YAxis
        onPositionChanged: dragActive()

    }
}
