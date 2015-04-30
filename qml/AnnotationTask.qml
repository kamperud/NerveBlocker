import QtQuick 2.4

Rectangle {
    signal gameMenuClicked()
    signal gameSummaryClicked()

    property var task: gamehandler.game.currentAnnotationTask
    property variant listOfY: [startY, startY,startY,startY,startY]
    property bool active: true
    property int startY: taskImage.height/2

    color: backgroundGrey

    Item {
        id: textArea
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: taskImage.y;

        Text {
            id: title
            text: active ? text1 : text2
            color: "white"
            font.family: ubuntu.name
            font.pixelSize:parent.height/8

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left
            width: parent.width
            wrapMode: Text.WordWrap


            property string text1: "Move the line\n until it covers the\n"+task.questionText.toUpperCase()
            property string text2: "The annotated image\n is shown below. Go to next\n page to see your score"

        }
    }

    Image {
        id: taskImage
        width: parent.width*11/12
        height: sourceSize.height*width/sourceSize.width
        anchors.bottom: botMenu.top
        anchors.bottomMargin: parent.width/10
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectFit
        source: task.imagePath


        //Mapped image
        Image{
            id:mappedImage
            anchors.fill: parent
            visible: !active
            source: task.mappedImagePath
        }
        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect (0, 0, width, height);
                ctx.strokeStyle = "white"
                ctx.lineWidth = parent.height/80
                ctx.beginPath()

                for(var i=0; i<points.model-1; ++i){
                    var fromItem = points.itemAt(i);
                    var toItem = points.itemAt(i+1);
                    var startAngle =    i === 0 ?
                                        Math.atan2(toItem.y-fromItem.y, toItem.x-fromItem.x) :
                                        tangential({previous: points.itemAt(i-1), center: points.itemAt(i), next: points.itemAt(i+1) }) - Math.PI/2;
                    var endAngle =    i === points.model-2 ?
                                        Math.atan2(fromItem.y-toItem.y, fromItem.x-toItem.x) :
                                        tangential({previous: points.itemAt(i), center: points.itemAt(i+1), next: points.itemAt(i+2) }) + Math.PI/2;
                    drawCurve({ context: ctx,
                                  start: fromItem.center,
                                  end: toItem.center,
                                  startAngle: startAngle,
                                  endAngle: endAngle
                              });
                }

                ctx.stroke()
            }

            function tangential(options){
                var prev = options.previous;
                var center = options.center;
                var next = options.next;
                var alpha = Math.atan2(prev.y-center.y, prev.x-center.x);
                var beta = Math.atan2(next.y-center.y, next.x-center.x);
                if(alpha<0) alpha+=Math.PI*2;
                return (alpha+beta)/2;
            }

            function drawCurve(options) {
                var ctx = options.context;
                var start = options.start;
                var end = options.end;
                var startAngle = options.startAngle || 0;
                var endAngle = options.endAngle || Math.PI;
                var weight = (end.x-start.x)*0.5;

                var control1 = {
                    x: start.x + Math.cos(startAngle) * weight,
                    y: start.y + Math.sin(startAngle) * weight
                };
                var control2 = {
                    x: end.x + Math.cos(endAngle) * weight,
                    y: end.y + Math.sin(endAngle) * weight
                };

                ctx.moveTo(start.x, start.y);
                ctx.bezierCurveTo(control1.x, control1.y,
                                  control2.x, control2.y,
                                  end.x, end.y);
            }
        }

        Repeater {
            id: points
            model: 5
            AnnotationPoint {
                y: listOfY[modelData]
                x: task.xValues[modelData] * taskImage.width / taskImage.sourceSize.width
                mouse.drag.maximumY: taskImage.height - height
                mouse.drag.minimumY: 0
                visible: active
                onYChanged: {
                    listOfY[modelData] = y;
                    canvas.requestPaint();
                }

            }
        }

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

                //var b = [points.itemAt(0).x, points.itemAt(1).x, points.itemAt(2).x, points.itemAt(3).x, points.itemAt(4).x];
                //b = b.map(function(foo){return foo * taskImage.sourceSize.width / taskImage.width;});
                var a = listOfY;
                a = a.map(function(foo){return foo * taskImage.sourceSize.height / taskImage.height;});
                //console.log("x: ");
                //console.log(b);
                //console.log("y: ");
                //console.log(a);
                task.answerAnnotationTask(a);
            }

            //NEXT, Game done
            else {
                gameSummaryClicked();
            }
        }
    }
}

