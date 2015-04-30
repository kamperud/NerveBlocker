import QtQuick 2.0
import UllApp 1.0;

Item {
    id: textArea
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: taskImage.top
    height: parent.height - taskImage.height;
    
    Text {
        color: "white"
        text: qsTr("Touch the")
        font.family: ubuntu.name
        font.pixelSize:main.height/main.width<1.5 ? parent.width/22 : parent.width/18
        
        visible: !task.answered
        
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter

        anchors.top: parent.top
        anchors.topMargin: main.height/main.width<1.5 ? parent.height/20 : parent.height/10
        anchors.right: parent.right
        anchors.left: parent.left
    }
    
    Text {
        id: question2
        font.bold: true
        font.pixelSize: main.height/main.width<1.7 ? parent.width/20 : parent.width/15
        font.family: ubuntu.name
        font.capitalization: Font.AllUppercase
        
        visible: !task.answered
        text: getOrganName(gamehandler.game.currentTask.organ)
        color: "white"
        width: parent.width
        wrapMode: Text.WordWrap
        
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Text {
        id: feedback
        font.bold: true
        font.pixelSize: parent.height/3
        font.family: ubuntu.name
        font.capitalization: Font.AllUppercase
        
        visible: task.answered
        text: task.correct ? "Correct" : "Wrong"
        color: task.correct ? "#a0e153" : "red"
        
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenterOffset: -parent.height/10
        anchors.verticalCenter: parent.verticalCenter
    }
    
    Text {
        id: helperText
        color: getOrganColor(task.organ)
        text: qsTr("It's the ") + getOrganColor(task.organ) + " one"
        font.family: ubuntu.name
        font.pixelSize: main.height/main.width<1.5 ? parent.width/25 : parent.width/18
        
        visible: (gamehandler.game.mode === Mode.TUTORIAL
                  || task.answered && !task.correct && gamehandler.game.mode != Mode.TIMED)
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
    }
}
