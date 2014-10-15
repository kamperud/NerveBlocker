import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Button {
    id: button
    height: applicationWindow1.height/6
    text: qsTr("Default")
    anchors.rightMargin: 0
    anchors.leftMargin: 0
    anchors.left: parent.left
    anchors.right: parent.right
    style: ButtonStyle {
        background: Rectangle{
            gradient: Gradient {
                 GradientStop { position: 0.0; color: button.pressed ? "#800000" : "#ff4040"}
                 GradientStop { position: 1.0; color: button.pressed ? "#bf0000" :  "#ff8080"}
            }
        }
    }
}
