import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Styles 1.4
// import Qt.labs.platform 1.1
Window {
    width: 640
    height: 700
    visible: true
    title: qsTr("Autotyper")
    Rectangle{
        anchors.fill:   parent
        color: "#121212"
    }

    Rectangle {
        id: frame1
        objectName: "frame"
        // clip: true
        width: parent.width
        height: parent.height - 185
        border.color: "black"
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            leftMargin: 12
            topMargin: 12
            rightMargin: 12
        }

        ScrollView  {
            // id: con
            // text:   "Start typing"
            anchors.fill:   frame1
            background: Rectangle{
                color:  "#161618"
                opacity:    0.9
                // border.color:   "#161618"
            }
            TextArea {
                id: content
                placeholderText:    "Begin typing..."
                // anchors.fill:   parent
                font.pixelSize:  24
                color:  "white"
                focus:    true
                background: Rectangle{
//                        anchors.fill:   parent
                        color:  "#161618"
                        // border.color: focus.enabled ? "red" : "blue"
                    }
            }
        }

    }

    Rectangle{
        id: frame2
        anchors.top:    frame1.bottom
        anchors.topMargin:  15
        width:  parent.width
        color:  "#121212"
        anchors{
            leftMargin: 12
            rightMargin: 12
        }

        height: 75
        CheckBox{
            id: ls
            checked:    false
            indicator: Rectangle {
                implicitWidth: 26
                implicitHeight: 26
                x: ls.leftPadding
                y: parent.height / 2 - height / 2
                radius: 3
                // border.color: control.down ? "#17a81a" : "#21be2b"

                Rectangle {
                    width: 14
                    height: 14
                    x: 6
                    y: 6
                    radius: 2
                    color: ls.down ? "white" : "orange"
                    visible: ls.checked
                }
            }

            contentItem: Text {
                text: ls.text
                font: ls.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                verticalAlignment: Text.AlignVCenter
                leftPadding: ls.indicator.width + ls.spacing
            }
            text:   "Select text from image"
            // color:  "white"
            anchors.topMargin:  15
            anchors.horizontalCenter:   frame2.horizontalCenter
        }
        
        Button{
            id: explorer
            contentItem:    Text{
                text: explorer.text
                font: explorer.font
            // opacity: enabled ? 1.0 : 0.3
                opacity:    1
                color:  "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle{
                radius: 10
                opacity:    1
                // color:  "#03DAC6"bkwaass
                color:  ls.checked ? "#BB86FC" : "#CF6679"
            }
            anchors{
                top:    ls.bottom
                horizontalCenter:   frame2.horizontalCenter
                topMargin:  15
            }
            enabled: ls.checked ?   true : false   
            text:   "Open Image"
            onClicked:  set(textOnly.openDialog())
            function set(op){
                content.text=   op
            }
        }
    }


    Button {
        id: control
        text: "Start"
        font.pixelSize: 20
        // color:  "cyan"
        // font.color: "white"
        width: 100
        height: 50
        // color:  "pink"scddcs
        anchors.top: frame2.bottom
        contentItem: Text {
            text: control.text
            font: control.font
            // opacity: enabled ? 1.0 : 0.3
            opacity:    1
            color:  "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        background: Rectangle{
            radius: 10
            opacity:    1
            // color:  "#03DAC6"
            color:  "#03DAC6"
        }

        anchors.topMargin: 15
        anchors.horizontalCenter: frame2.horizontalCenter
        onClicked: textOnly.startTyping(content.text);
    }

}
