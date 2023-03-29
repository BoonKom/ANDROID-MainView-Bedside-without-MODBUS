import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.0
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import QtQuick
import QtQuick.Controls


    RoundButton{
        id: light_button
        width:  448
        height: 151
        checkable: true
        checked: false
//        x: Window.width/2.0 - width/2.0
//        y: 500
        Rectangle{
            id: indicator
            width: 100
            height: 15
            radius: 5
            x: light_button.width/2.0 - indicator.width/2.0
            y: 15
            color: {
                if(light_button.checked)
                    return "#4CDC5E"
                else
                    return "black"
            }

            border.color: {
                if(light_button.checked)
                {
                    return "black"
                }
                else
                    return "white"
            }

            border.width: {
                if(light_button.checked)
                {
                    return 0
                }
                else
                    return 3
            }
        }

        background: Rectangle{
            width:  448
            height: 151
            radius: 50
            color: {
                if(light_button.checked)
                    return "#565656"
                else
                    return "black"
            }
            border.color: "white"
            border.width: 5
        }
        onCheckedChanged: {
            console.log(Window.width)
            console.log(Window.height)
            console.log(light_button.width)
        }
    }


