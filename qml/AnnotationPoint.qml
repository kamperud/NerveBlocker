import QtQuick 2.0

Rectangle{
    signal dragActive()
    property alias mouse: mouseArea
    id: annotationPoint
    width: parent.width/20
    height: width
    color: "red"
    radius: width/2
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.YAxis
        onPositionChanged: dragActive()

    }
}
