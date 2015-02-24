import QtQuick 2.0

Item {
    id: rootDraw

    property int lineWidth: 8
    property color lineColor: "#FFF"
    property int point1x
    property int point1y
    property int point2x
    property int point2y

    PathView {
        id: rooPath
        anchors.fill: parent
        model: (Math.abs(point1x - point2x) + Math.abs(point1y - point2y))
        interactive: false
        delegate: Rectangle{ color:lineColor;width:lineWidth;height:lineWidth;radius: lineWidth/2;smooth: true }
        path: Path {
            startX: point1x; startY: point1y
            PathLine {
                x:point2x; y: point2y
            }
        }
    }
}

