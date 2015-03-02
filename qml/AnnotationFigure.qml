import QtQuick 2.0

Item {
    property alias startPoint: point1
    property alias midPoint: point2
    property alias stopPoint: point3

    property int maxX
    property int maxY
    property int minX
    property int minY
    property real scalingX
    property real scalingY

    property var list: [point1.x*scalingX, point1.y*scalingY, midPoint.x*scalingX, midPoint.y*scalingY, point3.x*scalingX, point3.y*scalingY]
    function getListOfPoints(){
        var pointsList = []
        for(var i in list){
            pointsList.push(list[i]);
            console.log(pointsList[i]);
        }
        return pointsList;
    }



    AnnotationPoint{
        id: point1
        x: 0
        y: 0
    }

    AnnotationPoint {
        id: point2
        x: 150
        y: 200
    }

    AnnotationPoint{
        id: point3
        x: 250
        y: 10
    }

    AnnotationMouseArea{
        id: moveStart
        anchors.fill: point1
        drag.target: point1
    }

    AnnotationMouseArea{
        id: moveMid
        anchors.fill: point2
        drag.target: point2
    }


    AnnotationMouseArea {
        id: moveStop
        anchors.fill: point3
        drag.target: point3
    }

    PathDraw {
        id: line1
        lineWidth: 1
        lineColor: "#FFF"
        point1x: point1.x + (point1.width / 2)
        point1y: point1.y + (point1.height / 2)
        point2x: point2.x + (point2.width / 2)
        point2y: point2.y + (point2.height / 2)
    }

    PathDraw{
        id: line2
        lineWidth: 1
        lineColor: "#FFF"
        point1x: point2.x + (point2.width / 2)
        point1y: point2.y + (point2.height / 2)
        point2x: point3.x + (point3.width / 2)
        point2y: point3.y + (point3.height / 2)
    }
}

