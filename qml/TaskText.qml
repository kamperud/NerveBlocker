import QtQuick 2.0
import UllApp 1.0;
//import QtMultimedia 5.0;
//import QtQuick.Layouts 1.1
//import QtQuick.Controls 1.2
// Fjernet for aa gjoere appen mindre



Item {
    id: textArea
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: taskImage.top
    height: parent.height - taskImage.height;
    
    Text {
        color: "#ffffff"
        text: gamehandler.game.mode !== Mode.DRAG ? qsTr("Touch the") : qsTr("Annotate the")
        font.family: ubuntu.name
        font.pixelSize:parent.height/5
        
        visible: !task.answered
        
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -question2.font.pixelSize
        anchors.right: parent.right
        anchors.left: parent.left
    }
    
    Text {
        id: question2
        font.bold: true
        font.pixelSize: parent.height/4
        font.family: ubuntu.name
        font.capitalization: Font.AllUppercase
        
        visible: !task.answered
        text: getOrganName(gamehandler.game.currentTask.organ)
        color: "white"
        
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
        font.pixelSize:parent.height/5
        
        visible: (gamehandler.game.mode === Mode.TUTORIAL
                  || task.answered && !task.correct && gamehandler.game.mode != Mode.TIMED)
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter
        
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
    }
}
