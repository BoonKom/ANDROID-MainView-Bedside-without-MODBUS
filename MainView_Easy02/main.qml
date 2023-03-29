import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Material 2.0
import QtMultimedia 5.0
import "ALARM_Stack04"
import "HOME_Stack01"
import "object"
import "AIR_Stack03"
Window{
    id: mainWindow
    width: 1101
    height: 688
    visibility: Window.FullScreen

    TabBar{
        id: bar
        height: 50
        anchors.bottom: parent.bottom
        currentIndex: 1
        anchors.bottomMargin: 0
        spacing: 0


        TabButton{
            id: homeBar
            x: 0
            width: mainWindow.width/4.0
            text: "HOME"
            anchors{
                bottom: parent.bottom
                bottomMargin: 0
                top: parent.top
                topMargin: 0
            }
            font.bold: true
            background: Rectangle{
                color: {
                    if(bar.currentIndex === 0)
                    {
                        return "black"
                    }
                    else
                    {
                        return "#616161"
                    }
                }
            }
        }
        TabButton{
            id: airBar
            x: (mainWindow.width/4.0) + homeBar.x
            width: mainWindow.width/4.0
            text: "AIR"

            anchors{
                bottom: parent.bottom
                bottomMargin: 0
                top: parent.top
                topMargin: 0
            }
            background: Rectangle{
                color: {
                    if(bar.currentIndex === 1)
                    {
//                        border.color = "#424242"
//                        border.width = 3
                        return "black"
                    }
                    else
                    {
                        return "#616161"
                    }
                }
            }

        }
        TabButton{
            id: lightBar
            x: (mainWindow.width/4.0) + homeBar.x + airBar.x
            width: mainWindow.width/4.0
            text: "LIGHT"
            anchors{
                bottom: parent.bottom
                bottomMargin: 0
                top: parent.top
                topMargin: 0
            }
            background: Rectangle{
                color: {
                    if(bar.currentIndex === 2)
                    {
                        return "black"
                    }
                    else
                    {
                        return "#616161"
                    }
                }
            }

        }
        TabButton{
            id: alarmBar
            x: (mainWindow.width/4.0) + homeBar.x + airBar.x + lightBar.x
            width: mainWindow.width/4.0
            text: "ALARM"
            anchors{
                bottom: parent.bottom
                bottomMargin: 0
                top: parent.top
                topMargin: 0
            }
            background: Rectangle{
                color: {
                    if(bar.currentIndex === 3)
                    {
                        return "black"
                    }
                    else
                    {
                        return "#616161"
                    }
                }
            }

        }
    } //End of Tabbar


    StackLayout{
        id: stack_layout
        height: 638
        currentIndex: bar.currentIndex

        Rectangle{
            id: ex01
            width: 1101
            height: 688
            TimeAndDateShow{
                id: timedate
                x: 0
                y: 0
                width: 1101
                height: 688
            }
        }
        Rectangle{
            id: ex02
            width: 1024
            height: 300
            color: "black"
            Cslider{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
        Rectangle{
            id: ex03
            width: 1024
            height: 300
            color: "black"
            OwnSwitch{
                id: left_sw
                y: 47
                width: 448
                height: 151

                font.pixelSize:40
                anchors.horizontalCenterOffset: -250
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    text: qsTr("LEFT")
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "white"
                }
            }

            OwnSwitch {
                id: right_sw
                y: 47
                width: 448
                height: 151

                font.pixelSize: 40
                Text {
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "#ffffff"
                    text: qsTr("RIGHT")
                }
                anchors.horizontalCenterOffset: 250
                anchors.horizontalCenter: parent.horizontalCenter
            }

            OwnSwitch {
                id: desk_sw
                width: 448
                height: 151

                anchors.top: left_sw.bottom
                font.pixelSize: 40
                anchors.topMargin: 50
                Text {
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "#ffffff"
                    text: qsTr("DESK")
                }
                anchors.horizontalCenterOffset: -250
                anchors.horizontalCenter: parent.horizontalCenter
            }

            OwnSwitch {
                id: entrance_sw
                width: 448
                height: 151

                anchors.top: right_sw.bottom
                font.pixelSize: 40
                Text {
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "#ffffff"
                    text: qsTr("ENTRANCE")
                }
                anchors.horizontalCenterOffset: 250
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 50
            }

            OwnSwitch {
                id: center_sw
                width: 448
                height: 151
                anchors.top: desk_sw.bottom
                font.pixelSize: 40
                anchors.topMargin: 50
                Text {
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "#ffffff"
                    text: qsTr("CENTER")
                }
                anchors.horizontalCenterOffset: -250
                anchors.horizontalCenter: parent.horizontalCenter
            }

            OwnSwitch {
                id: master_sw
                width: 448
                height: 151
                anchors.top: entrance_sw.bottom
                font.pixelSize: 40
                anchors.topMargin: 50
                Text {
                    x: 448/2 - width/2
                    y: 151/2 - height/2
                    color: "#ffffff"
                    text: qsTr("MASTER")
                }
                onCheckedChanged: {
                    if(master_sw.checked === true)
                    {
                        left_sw.checked = true
                        right_sw.checked = true
                        desk_sw.checked = true
                        entrance_sw.checked = true
                        center_sw.checked = true
                    }
                    else
                    {
                        left_sw.checked = false
                        right_sw.checked = false
                        desk_sw.checked = false
                        entrance_sw.checked = false
                        center_sw.checked = false
                    }

                }

                anchors.horizontalCenterOffset: 250
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Rectangle{
            id: alarm_stack
            width: 1101
            height: 638
            color: "black"
            ListView{
                id: alarmListView
                width: 638
                anchors.fill: parent
                model: AlarmListElement{
                    id: alarm_was_set
                }
                delegate: AlarmListView{}
            }
            SetAlarmClock {
                id: alarmDialog
                x: Math.round((parent.width - width) / 2)
                y: Math.round((parent.height - height) / 2)
                alarmModel: alarmListView.model
            }

            RoundButton{
                id: round_Btn
                width: 75
                height: 75
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 70
                background: Rectangle{
                    id: background_roundBtn
                    width: 75
                    height: 75
                    radius: width/2
                    color: {
                        if(round_Btn.down)
                            return "white"
                        else
                            return "black"
                    }
                    border.color: "white"
                    border.width: 2
                    anchors.fill: round_Btn

                }
                Text {
                    id: text_roundBtn
                    width: 75
                    height: 75
                    font.pixelSize: 60
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignBottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: {
                        if(round_Btn.down)
                            return "black"
                        else
                            return "white"
                    }
                    text: qsTr("+")
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: robotoLight.name
                }
                onClicked:{

                    alarmDialog.open()
                    console.log(text_roundBtn.width)
                    console.log(text_roundBtn.height)
                    console.log(mainWindow.width)
                    console.log(mainWindow.height)

                }

            }
            //            AlarmNotificate{
            //                id: alarmNontification
            //                width: 100
            //                height: 100
            //                x: 0
            //                y: 0
            //            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
