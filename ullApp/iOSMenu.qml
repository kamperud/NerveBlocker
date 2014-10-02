import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

ToolBar {
    id: toolbar

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
        width: parent.width
        //clip: false
        ToolButton {
            id: navBack
            clip: false
            visible: true
            activeFocusOnPress: false
            anchors.left: parent.left
            iconSource: "ios/images/back-50-3399FF.png"
            /*
            style: ButtonStyle{

                label:Text{
                    text: qsTr("Back")
                    color: "#3399FF"
                }

                background:Rectangle{
                    Rectangle{
                        color: "white"
                    }
                }
            }
            */

        }
        Text {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Ultrasound")
            color: "black"
        }
        ToolButton {
            id: login
            anchors.right: parent.right
            style: ButtonStyle{
                label:Text{
                    text: qsTr("Login")
                    color: "#3399FF"
                }
                background:Rectangle{
                    Rectangle{
                        color: "white"
                    }
                }
            }
        }
    }
}
