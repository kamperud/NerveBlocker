import QtQuick 2.0

Item {
    property alias startPoint: startPoint
    property alias midPoint: mid
    property alias stopPoint: stopPoint

    property int maxX
    property int maxY
    property int minX
    property int minY
    property real scalingX
    property real scalingY

    property var list: [startPoint.x*scalingX, startPoint.y*scalingY, midPoint.x*scalingX, midPoint.y*scalingY, stopPoint.x*scalingX, stopPoint.y*scalingY]
    function getListOfPoints(){
        var pointsList = []
        for(var i in list){
            pointsList.push(list[i]);
            console.log(pointsList[i]);
        }
        return pointsList;
    }



    Rectangle{
        id: startPoint
        width: 10
        height: 10
        x: 0
        y: 0
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

    AnnotationMouseArea{
        id: moveStart
        anchors.fill: startPoint
        drag.target: startPoint
    }

    AnnotationMouseArea{
        id: moveMid
        anchors.fill: mid
        drag.target: mid
    }


    AnnotationMouseArea {
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

