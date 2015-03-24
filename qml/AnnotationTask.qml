import QtQuick 2.4

Rectangle {
    signal gameMenuClicked()
    signal gameSummaryClicked()

    property var task: gamehandler.game.currentAnnotationTask
    property bool active: true
    property int commonStartingY: taskImage.height/2

    color: backgroundGrey


    Image {
        id: taskImage
        width: parent.width*11/12
        height: sourceSize.height*width/sourceSize.width
        anchors.bottom: botMenu.top
        anchors.bottomMargin: parent.width/20
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectFit
        source: task.imagePath


        //Mapped image
        Image{
            id:mappedImage
            anchors.fill: parent
            source: "gameImages/1_map.png"
        }
        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
              /*  var ctx = getContext("2d")
                ctx.clearRect (0, 0, width, height);
                ctx.strokeStyle = "white"
                ctx.lineWidth = parent.height/80
                ctx.beginPath()
                ctx.moveTo(points.itemAt(1).x+points.itemAt(1).width/2,points.itemAt(1).y+points.itemAt(1).height/2)
                ctx.lineTo(points.itemAt(2).x+points.itemAt(2).width/2,points.itemAt(2).y+points.itemAt(2).height/2)
                ctx.lineTo(points.itemAt(3).x+points.itemAt(3).width/2,points.itemAt(3).y+points.itemAt(3).height/2)
                ctx.lineTo(points.itemAt(4).x+points.itemAt(4).width/2,points.itemAt(4).y+points.itemAt(4).height/2)
                ctx.lineTo(points.itemAt(5).x+points.itemAt(5).width/2,points.itemAt(5).y+points.itemAt(5).height/2)

                ctx.stroke()
*/
            }
        }
        Repeater {
            id: points
            model: 5
            AnnotationPoint {
                y: commonStartingY
                onDragActive: canvas.requestPaint();
            }

            onItemAdded: {
                //points.itemAt(index).x = task.xValues[index];
                // this x needs to be calculated, but not yet
            }
        }


        /*AnnotationPoint {
            id: point1
            x: parent.width/18
            y: commonStartingY
            onDragActive: canvas.requestPaint();

        }
        AnnotationPoint {
            id: point2
            x: parent.width*5/18
            y: commonStartingY
            onDragActive: canvas.requestPaint();

        }
        AnnotationPoint {
            id: point3
            x: parent.width*9/18
            y: commonStartingY
            onDragActive: canvas.requestPaint();

        }
        AnnotationPoint {
            id: point4
            x: parent.width*13/18
            y: commonStartingY
            onDragActive: canvas.requestPaint();
        }
        AnnotationPoint {
            id: point5
            x: parent.width*17/18
            y: commonStartingY
            onDragActive: canvas.requestPaint();
        }*/

    }


    //MENU button
    MenuButton {
        id: botMenu
        onMenuClicked: {
            gameMenuClicked();
        }
    }

    NextButton {
        id: botNext
        arrowVisible: false;

        onNextClicked: {

            //CONFIRM
            if(active){
                arrowVisible = true;
                active = false;
                /*console.log("x: "+ taskImage.sourceSize.width*point1.x/taskImage.width + " y: " +taskImage.sourceSize.height*point1.y/taskImage.height+"\n");
                console.log("x: "+ taskImage.sourceSize.width*point2.x/taskImage.width + " y: " +taskImage.sourceSize.height*point2.y/taskImage.height+"\n");
                console.log("x: "+ taskImage.sourceSize.width*point3.x/taskImage.width+ " y: " +taskImage.sourceSize.height*point3.y/taskImage.height+"\n");
                console.log("x: "+ taskImage.sourceSize.width*point4.x/taskImage.width+ " y: " +taskImage.sourceSize.height*point4.y/taskImage.height+"\n");
                console.log("x: "+ taskImage.sourceSize.width*point5.x/taskImage.width+ " y: " +taskImage.sourceSize.height*point5.y/taskImage.height+"\n");
           */ }

            //NEXT, Game done
            else {
                gameSummaryClicked();
            }
        }
    }
}

