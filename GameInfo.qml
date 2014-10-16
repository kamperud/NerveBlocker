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
        contentHeight: 3*parent.height

        FontLoader { id: birdFont; source: "/LittleBird.ttf" }
        FontLoader { id: orangeFont; source: "/orange.ttf" }


        Text {
            id: welcomeText
            text: "Welcome to the tutorial for"
            font.family: orangeFont.name
            font.pixelSize: parent.width/15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: gameInfo.height/30
            color: "yellow"
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
        Text {
            id: explanation1
            text: "In the game you'll be presented with pictures, like the one below, of ultrasound images"
            font.family: orangeFont.name
            font.pixelSize: parent.width/20
            color: "yellow"
            wrapMode: Text.WordWrap
            width: parent.width

            horizontalAlignment: Text.AlignHCenter
            anchors.top: gametitle.bottom
            anchors.topMargin: gameInfo.height/50
        }


        Image {
            id: infoImage
            anchors.top: explanation1.bottom
            height: (parent.width>parent.height) ? parent.height : sourceSize.height*parent.width/sourceSize.width
            width:  (parent.width<parent.height) ? parent.width : sourceSize.width*parent.height/sourceSize.height

            source: "gameImages/1.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }
        Text{
            id: gridTitle
            text: "The colors in the picture outline bodyparts"
            font.family: orangeFont.name
            font.pixelSize: infoScroller.width/20
            color: "yellow"
            width: parent.width
            wrapMode: Text.WordWrap

            anchors.top: infoImage.bottom
            horizontalAlignment: Text.AlignHCenter


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

        Text {
            id: explanation2
            text: "You'll be asked to identify these body parts in images without outlines with special emphasis on the nerve"
            font.family: orangeFont.name
            font.pixelSize: parent.width/20
            color: "yellow"
            wrapMode: Text.WordWrap
            width: parent.width

            horizontalAlignment: Text.AlignHCenter
            anchors.top: grid.bottom
            anchors.topMargin: gameInfo.height/50
        }
        Image {
            id: statusBarImage
            anchors.top: explanation2.bottom
            height: (parent.width>parent.height) ? parent.height : sourceSize.height*parent.width/sourceSize.width
            width:  (parent.width<parent.height) ? parent.width : sourceSize.width*parent.height/sourceSize.height

            source: "/bar.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }

    }

}
