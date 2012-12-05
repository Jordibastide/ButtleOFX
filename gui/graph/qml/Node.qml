import QtQuick 1.1

Item {
    id: node
    height: 35 + 7*_nodeManager.getWrapper(node).nbInput
    width: 110
    x: _nodeManager.getWrapper(node).x
    y: _nodeManager.getWrapper(node).y
    focus: _nodeManager.currentNode == node

    Keys.onPressed: {
            if (event.key==Qt.Key_Delete) {
                if (node.focus == true){
                    _nodeManager.deleteNode(node)
                }
            }
        }

    Rectangle {
        id: nodeBorder
        height: node.height
        width: node.width
        anchors.centerIn: parent
        color: _nodeManager.getWrapper(node).color
        opacity: 0.5
        radius: 10
    }
    Rectangle {
        id: nodeRectangle
        anchors.centerIn: parent
        height: node.height - 8
        width: node.width - 8
        color: "#bbbbbb"
        radius: 8
        Text {
            anchors.centerIn: parent
            text: _nodeManager.getWrapper(node).name
            font.pointSize: 10
            color: "black"
        }
    }
    Column {
        id: nodeInputs
        anchors.horizontalCenter: parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2
        Repeater {
            model: _nodeManager.getWrapper(node).nbInput
            Rectangle {
                height: 5
                width: 5
                color: "#bbbbbb"
                radius: 2
            }
        }
    }
    Column {
        id: nodeOutputs
        anchors.horizontalCenter: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2
        Repeater {
            model: 1
            Rectangle {
                height: 5
                width: 5
                color: "#bbbbbb"
                radius: 2
                MouseArea {
                    anchors.fill: parent
                }
            }
        }
    }
    states: State {
        name: "selected";
        when: node.focus
        PropertyChanges {
            target: nodeRectangle
            color: "#d9d9d9"
        }
    }
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis
        onPressed: {
            node.focus = true
            parent.opacity = 0.5
            _nodeManager.currentNode = node;
        }
        onReleased: {
            parent.opacity = 1
        }
    }   
}