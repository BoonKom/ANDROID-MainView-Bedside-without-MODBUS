import QtQuick 2.0
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Material 2.0

Dialog{
    id: alarm_wake
    width: 500
    height: 500
    x: Window.width/2.0 - width/2.0
    y: Window.height/2.0 - width/2.0
    visible: false
    Text{
        text: "ALARM!"
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 40
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
    }

    background: Rectangle{
        color: "black"
        border.width: 5
        border.color: "orange"

   }
   onRejected: {
       alarm_wake.visible = false
       alarm_wake.close()
       playSound.stop()
   }

//    Button{
//        id: ok
//        x: 233
//        y: 230
//        width: 50
//        height: 50
//        onClicked: {
//            alarm_wake.visible = false
//            alarm_wake.close()

//        }
//    }
    RoundButton{
        id: ok_button
        y: 388
        width:  200
        height: 90
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        background:Rectangle{
            id: rectangle1
            width:  200
            height: 90
            radius: 50
            Text{
                color: "white"
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: "OK"
                anchors.verticalCenter: parent.verticalCenter
            }
            color:{
                if(ok_button.down)
                    return "grey"
                else
                    return "black"
            }
            border.color: "white"
            border.width: 5
        }
        onClicked: {
            alarm_wake.visible = false
            alarm_wake.close()
            playSound.stop()
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}
}
##^##*/
