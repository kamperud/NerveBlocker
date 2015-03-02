import QtQuick 2.0

Item {
    property alias startPoint: startPoint
    property alias midPoint: mid
    property alias stopPoint: stopPoint

    property var list: [startPoint.x, startPoint.y, midPoint.x, midPoint.y, stopPoint.x, stopPoint.y]
    function getListOfPoints(){
        var pointsList = []
        for(var i in list){
            pointsList.push(i);
        }
        return pointsList;
    }

    Rectangle{
        id: startPoint
        width: 10
        height: 10
        x: 30
        y: 50
        color: "red"
        radius: 5
    }

    Rectangle{
        id: mid
        width: 10
        height: 10
        x: 150
        y: 200
        color: "red"
        radius: 5
    }

    Rectangle{
        id: stopPoint
        width: 10
        height: 10
        x: 250
        y: 10
        color: "red"
        radius: 5
    }

    MouseArea{
        id: moveStart
        anchors.fill: startPoint
        drag.target: startPoint
    }

    MouseArea{
        id: moveMid
        anchors.fill: mid
        drag.target: mid
    }


    MouseArea{
        id: moveStop
        anchors.fill: stopPoint
        drag.target: stopPoint
    }

    PathDraw {
        id: line1
        lineWidth: 1
        lineColor: "#FFF"
        point1x: startPoint.x + (startPoint.width / 2)
        point1y: startPoint.y + (startPoint.height / 2)
        point2x: mid.x + (mid.width / 2)
        point2y: mid.y + (mid.height / 2)
    }

    PathDraw{
        id: line2
        lineWidth: 1
        lineColor: "#FFF"
        point1x: mid.x + (mid.width / 2)
        point1y: mid.y + (mid.height / 2)
        point2x: stopPoint.x + (stopPoint.width / 2)
        point2y: stopPoint.y + (stopPoint.height / 2)
    }
}

