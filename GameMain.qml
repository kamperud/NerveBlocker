import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 450
    height: 800
    title: qsTr("UllApp")
    color: "#ffffff"

    toolBar: Qt.createComponent(sys.isIos ? "iOSMenu.qml" : "").createObject(applicationWindow1, {})

    StackView {
        id: mainArea
//        anchors.right: parent.right
//        anchors.left: parent.left
        anchors.fill: parent
        x: 0
        y: 0
        initialItem: game
        focus: true // important - otherwise we'll get no key events

        Keys.onReleased: {
           if (event.key === Qt.Key_Back) {
               event.accepted = true
               mainArea.pop()
               mainArea.y = applicationWindow1.height/4
           }
        }
        Game {
            id: game
            visible: true
        }
//        GameInfo {
//            visible: false
//        }

//        GameStart {
//            visible: false
//        }

//        GameFinished {
//            visible: true
//        }
    }
}
