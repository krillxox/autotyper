import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Autotyper")
    Rectangle {
        id: frame
        objectName: "frame"
        clip: true
        width: parent.width
        height: parent.height - 150
        border.color: "black"
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            leftMargin: 12
            topMargin: 12
            rightMargin: 12
        }

        TextEdit {
            id: content
            text: "sf"
            font.pixelSize: 30
            x: -hbar.position * width
            y: -vbar.position * height
        }

        ScrollBar {
            id: vbar
            hoverEnabled: true
            active: true
            orientation: Qt.Vertical
            size: frame.height / content.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

        ScrollBar {
            id: hbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Horizontal
            size: frame.width / content.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }

    }

    Button {
        id: ac
        text: "Start"
        width: 100
        height: 50
        anchors.top: frame.bottom
        anchors.topMargin: 15
        anchors.horizontalCenter: frame.horizontalCenter
//        onClicked:
    }
    Text {
        id: dunni
        text: content.x
        anchors.top: ac.bottom
    }
    
}
