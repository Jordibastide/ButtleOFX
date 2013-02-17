import QtQuick 1.1
import QuickMamba 1.0

Rectangle {
    id: clip
    property string port

    QtObject {
        id: c
        property variant clipModel: model.object
    }

    height: clipSize
    width: clipSize
    color:  clipMouseArea.containsMouse ? "#00b2a1" : "#bbbbbb"
    radius: 4

    Rectangle {

        id: clipName
        color: "#333"
        radius: 3
        opacity: clipMouseArea.containsMouse ? 1 : 0
        height: 17
        width: clipNameText.width + 10
        x: clip.port == "output" ? parent.x + 15 : parent.x - clipNameText.width - 15
        y: -5

        Text{
            id: clipNameText
            text: c.clipModel.name
            font.pointSize: 8
            color: "#999"
            x: 7
            y: 4
        }
    }

    MouseArea {
        id: clipMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            color = "#fff"
            _buttleData.connectionDragEvent(c.clipModel, index) // we send all information needed to identify the clip : nodename, port and clip number
            // take the focus of the MainWindow
            clip.forceActiveFocus()
        }
    }

    DropArea {
        anchors.fill: parent
        anchors.margins: -20
        onDrop: {
            if (hasText) {
                console.log("hoho " + text)
                //_buttleData.connectionDropEvent(c.clipModel, index)
                _buttleData.connectionDropEvent(text, c.clipModel, index)
            }
        }
    }
}
