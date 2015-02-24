import QtQuick 2.0
import UllApp 1.0;

// Disse har jeg fjernet fordi jeg
// mistenker at de ikke gjoer noe
// De bruker mye plass hvis de faar vaere her

//import QtQuick.Layouts 1.1
//import QtQuick.Controls 1.2
//import QtQml 2.2


Rectangle {
    id: botNext
    
    width: parent.width*4.5/12
    height: parent.height/10
    color: nextButton.pressed ? "#1fdada" : "#04bfbf"
    //color: nextButton.pressed && gamehandler.nextButtonVisible ?  "#cafcd8" :"#04bfbf"
    radius: 15
    anchors.right: parent.right
    anchors.rightMargin: parent.width/12
    anchors.bottom: parent.bottom
    anchors.bottomMargin: parent.width/20
    
    Image {
        id: image1
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "icons/arrow-19-512.png"
        visible: taskConfirmed
    }
    
    Text{
        id: confirmButton
        color: "#ffffff"
        text: qsTr("CONFIRM")
        font.family: ubuntu.name
        font.pixelSize: parent.height/2.5
        visible: !taskConfirmed
        
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
    }
    
    MouseArea {
        id: nextButton
        anchors.fill: parent
        onClicked: {
            //Game done
            if(game.finished && gamehandler.game.mode !== Mode.TIMED){
                gameSummaryClicked();
            } 
            //CONFIRM (annoret bilde)
            else if(taskXSet && !taskConfirmed){
                taskConfirmed = true;
                if(gamehandler.game.currentTask.answerTask(unscaledX, unscaledY) && gamehandler.game.mode === Mode.TIMED){
                    addTime();
                }
            }
            //NEXT
            else if(game.currentTask.answered){
                taskConfirmed = false;
                taskXSet = false;
                task.croXvisible = false;
                game.newTask();
            }
        }
    }
}
