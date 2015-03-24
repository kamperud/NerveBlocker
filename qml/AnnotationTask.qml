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
            font.pixelSize:parent.height/7

            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.left: parent.left


            property string text1: "Move the line\n until it covers the\n FASCIA ILIACA"
            property string text2: "The annotated image\n is shown below. Go to next\n page to see your score"

        }
    }

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
            visible: !active
            source: "gameImages/1_map.png"
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
                ctx.moveTo(points.itemAt(0).x+points.itemAt(0).width/2,points.itemAt(0).y+points.itemAt(0).height/2)
                ctx.lineTo(points.itemAt(1).x+points.itemAt(1).width/2,points.itemAt(1).y+points.itemAt(1).height/2)
                ctx.lineTo(points.itemAt(2).x+points.itemAt(2).width/2,points.itemAt(2).y+points.itemAt(2).height/2)
                ctx.lineTo(points.itemAt(3).x+points.itemAt(3).width/2,points.itemAt(3).y+points.itemAt(3).height/2)
                ctx.lineTo(points.itemAt(4).x+points.itemAt(4).width/2,points.itemAt(4).y+points.itemAt(4).height/2)

                ctx.stroke()

            }
        }

        Repeater {
            id: points
            model: 5
            AnnotationPoint {
                y: listOfY[modelData]
                x: task.xValues[modelData] * taskImage.width / taskImage.sourceSize.width
                onYChanged: {
                    listOfY[modelData] = mouse.Y;
                    console.log(listOfY);

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

                var a = listOfY;
                //a = a.map(function(foo){return foo * taskImage.sourceSize.height / taskImage.height;});
                console.log(listOfY);
                task.answerAnnotationTask(a);
            }

            //NEXT, Game done
            else {
                gameSummaryClicked();
            }
        }
    }
}

