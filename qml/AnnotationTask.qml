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
            z: 1
            source: game.currentTask.image.mappedImagePath
        }
        Canvas {
            anchors.fill: parent
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

