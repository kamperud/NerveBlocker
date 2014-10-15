import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

ToolBar {
    id: toolbar
    height: applicationWindow1.height / 10
    width: applicationWindow1.width

    Component.onCompleted: toolbar.data[0].item.children = [newRectangle];
    property Item _newRectangle: Rectangle {
        // The rectangle within the ToolBarStyle's panel
        // Gleaned from:
        // http://qt.gitorious.org/qt/qtquickcontrols/source/
        //   c304d741a27b5822a35d1fb83f8f5e65719907ce:src/styles/Base/ToolBarStyle.qml
        id: newRectangle
        anchors.fill: parent

        gradient: Gradient{
            //GradientStop{color: "#3399FF" ; position: 0}
            //GradientStop{color: "#66CCFF" ; position: 1}
            GradientStop{color: "white" ; position: 0}
            GradientStop{color: "white" ; position: 1}
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "#999"
        }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent

//        ToolButton {
//            id: navBack
//            anchors.left: parent.left
//            width: 1000
//            height: 1000

//            onClicked: {
//                mainArea.y = applicationWindow1.height / 4
//                mainArea.pop()
//            }
//            style: ButtonStyle{

//                background: Image{
//                    id: backImg
//                    visible: true
//                    source: navBack.pressed ? "ios/images/back-50-C2E0FF.png" : "ios/images/back-50-3399FF.png"
//                    anchors.fill: navBack
//                    anchors.margins: 6
//                    fillMode: Image.Stretch
//                }
//            }
//        }

        Item {
            id: navBack
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: toolbar.height - 20
            height: toolbar.height - 20

            Image{
                id: backImg
                source: navBackArea.pressed ? "ios/images/back-50-C2E0FF.png" : "ios/images/back-50-3399FF.png"
                anchors.fill: parent
                anchors.margins: 6
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                id: navBackArea
                anchors.fill: parent
                onClicked: {
                    mainArea.y = applicationWindow1.height / 4
                    mainArea.pop()
                }
            }
         }

        Text {
            id: title
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Ultrasound")
            color: "black"
//            font.pixelSize: toolbar.height - 30;
            font.pixelSize: toolbar.width*3/40

        }
        ToolButton {
            id: login
            anchors.right: parent.right
            style: ButtonStyle{
                label:Text{
                    text: qsTr("Login ")
                    color: login.pressed ? "#C2E0FF" : "#3399FF"
                    font.pixelSize: title.font.pixelSize - 5
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                background:Rectangle{
                    color: "white"
                }
            }
        }
    }
}
