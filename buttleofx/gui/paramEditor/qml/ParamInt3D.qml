import QtQuick 1.1

/*ParamDouble3D containts three input field*/

Item {
    id: containerParamDouble3D
    implicitWidth: 300
    implicitHeight: 30

    property variant paramObject: model.object

    /*Container of the two input field*/
     Row{
        id: paramDouble3DInputContainer
        spacing : 10

        // Title of the paramDouble
        Text {
            id: paramDouble3DTitle
            width: 80
            text: paramObject.text + " : "
            color: "white"
            anchors.top: parent.top
            anchors.verticalCenter: parent.verticalCenter
        }

        /* First input */
        Rectangle{
            height: 20
            width:40
            color: "#212121"
            border.width: 1
            border.color: "#333"
            radius: 3
            TextInput{
                id: paramDouble3Dinput1
                text: paramObject.value1
                anchors.left: parent.left
                anchors.leftMargin: 5
                maximumLength: 5
                color: activeFocus ? "white" : "grey"
                width: 40
                activeFocusOnPress : true
                selectByMouse : true
                onAccepted: paramObject.value1 = paramDouble3Dinput1.text
                validator: DoubleValidator{
                    bottom: paramObject.minimum
                    top:  paramObject.maximum
                }
            }
        }

        /* Second input */
        Rectangle{
            height: 20
            width:40
            color: "#212121"
            border.width: 1
            border.color: "#333"
            radius: 3
            TextInput{
                id: paramDouble3Dinput2
                text: paramObject.value2
                anchors.left: parent.left
                anchors.leftMargin: 5
                maximumLength: 5
                color: activeFocus ? "white" : "grey"
                width: 40
                selectByMouse : true
                onAccepted: paramObject.value2 = paramDouble3Dinput2.text
                validator: DoubleValidator{
                    bottom: paramObject.minimum
                    top: paramObject.maximum
                }
            }
        }

        /* Third input */
        Rectangle{
            height: 20
            width:40
            color: "#212121"
            border.width: 1
            border.color: "#333"
            radius: 3
            TextInput{
                id: paramDouble3Dinput3
                text: paramObject.value3
                anchors.left: parent.left
                anchors.leftMargin: 5
                maximumLength: 5
                color: activeFocus ? "white" : "grey"
                width: 40
                selectByMouse : true
                onAccepted: paramObject.value3 = paramDouble3Dinput3.text
                validator: DoubleValidator{
                    bottom: paramObject.minimum
                    top: paramObject.maximum
                }
            }
        }
    }
}