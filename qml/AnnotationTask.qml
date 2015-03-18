import QtQuick 2.4

Rectangle {
    signal gameMenuClicked()
    signal gameSummaryClicked()

    property var game: gamehandler.game
    property bool active: true

    Image {
        id: taskImage
        width: parent.width*11/12
        height: sourceSize.height*width/sourceSize.width
        anchors.bottom: botMenu.top
        anchors.bottomMargin: parent.width/20
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectFit
        source: game.currentTask.image.imagePath


        //Mapped image
        Image{
            id:mappedImage
            anchors.fill: parent
            source: game.currentTask.image.mappedImagePath
        }
        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect (0, 0, width, height);
                ctx.strokeStyle = "red"
                ctx.beginPath()
                ctx.moveTo(point1.x,point1.y)
                ctx.lineTo(point2.x,point2.y)
                ctx.stroke()

            }
        }
        AnnotationPoint {
            id: point1
            x: 50
            y: 200
            onDragActive: {
                canvas.requestPaint();
            }

        }
        AnnotationPoint {
            id: point2
            x: 200
            y: 200
            onDragActive: {
                canvas.requestPaint();
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
                //TODO contact C++ and answer task
            }

            //NEXT, Game done
            else {
                gameSummaryClicked();
            }
        }
    }
}

