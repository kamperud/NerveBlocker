import QtQuick 2.0

Rectangle {
    id: gameInfo
    width: 300
    height: 450
    color: "#333333"

    Flickable {
        id: infoScroller
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: explanation4.y + explanation4.contentHeight + parent.height/20

        FontLoader { id: birdFont; source: "/LittleBird.ttf" }
        FontLoader { id: orangeFont; source: "/orange.ttf" }

        ExplanationText {
            id: welcomeText
            text: "Welcome to the tutorial for"
            font.pixelSize: parent.width/15

            anchors.top: parent.top
            anchors.topMargin: gameInfo.height/30
        }
        Text {
            id: gametitle
            text: "NERVES"
            font.family: birdFont.name
            font.pixelSize: parent.width/10
            font.capitalization: Font.AllUppercase
            color: "yellow"

            anchors.top: welcomeText.bottom
            anchors.horizontalCenter: parent.horizontalCenter


        }
        ExplanationText {
            id: explanation1
            text: "In the game you'll be presented with pictures, like the one below, of ultrasound images"

            anchors.top: gametitle.bottom
            anchors.topMargin: gameInfo.height/50
        }

        Image {
            id: infoImage
            anchors.top: explanation1.bottom
            anchors.topMargin: gameInfo.height/30

            height: sourceSize.height*parent.width/sourceSize.width
            width:  parent.width

            source: "gameImages/1.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        ExplanationText{
            id: gridTitle
            text: "The colors in the picture outline bodyparts"

            anchors.top: infoImage.bottom
        }
        Row {
            id: grid
            spacing: 18
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: gridTitle.bottom

            Column {
                Text{
                    text: "Pink"
                    color: "#ff00ff"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                }
                Text{
                    text: "Yellow"
                    color: "yellow"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                }
                Text{
                    text: "Green"
                    color: "green"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                }
                Text{
                    text: "Red"
                    color: "red"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                }
            }
            Column{
                Text{
                    text: "Fascia Iliaca"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                    color: "yellow"
                }
                Text{
                    text: "Femoral Nerve"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                    color: "yellow"
                }
                Text{
                    text: "Femur"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                    color: "yellow"
                }
                Text{
                    text: "Femoral Artery"
                    font.family: orangeFont.name
                    font.pixelSize: infoScroller.width/20
                    color: "yellow"
                }
            }
        }

        ExplanationText {
            id: explanation2
            text: "You'll be asked to identify these body parts in images without outlines with special emphasis on the nerve"

            anchors.top: grid.bottom
            anchors.topMargin: gameInfo.height/50
        }

        Image {
            id: statusBarImage
            anchors.top: explanation2.bottom
            anchors.topMargin: parent.width/10
            height: sourceSize.height*parent.width/sourceSize.width
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20

            source: "/bar.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        ExplanationText {
            id: explanation3
            text: "When you've finished a task you get a new one by clicking the arrow at the bottom of the screen, pictured above. \
The middle number represents the points you've accumulated so far in the game the number furthest to the left is the point multiplier. The multiplier increases when you get a task right, and resets when you get one wrong"

            anchors.top: statusBarImage.bottom
            anchors.topMargin: gameInfo.height/30
        }
        ExplanationText {
            id: explanation4
            text: "When you've finished 10 tasks you get a final score. The final score is a result of the points you accumulated and the time you spent. The faster you are, the higher your score is"

            anchors.top: explanation3.bottom
            anchors.topMargin: gameInfo.height/10
        }


    }

}
