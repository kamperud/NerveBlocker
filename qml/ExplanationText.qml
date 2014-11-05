import QtQuick 2.0

Text {
    font.family: orangeFont.name
    font.pixelSize: parent.width/20
    color: "yellow"
    wrapMode: Text.WordWrap
    width: parent.width
    horizontalAlignment: Text.AlignHCenter
    anchors.right: parent.right
    anchors.rightMargin: parent.width/20
    anchors.left: parent.left
    anchors.leftMargin: parent.width/20

}
