import QtQuick 2.0
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11

Dialog {
    id: alarmDialog
    //title: "Add new alarm"
    x: 0
    y: 0
    width: 1101
    height: 688

    Timer{
        id: timer_run
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            var hour = new Date()
            var hour_Time = hour.toLocaleTimeString(Qt.locale("en_US"), "hh")
            var min = new Date()
            var minute_Time = min.toLocaleTimeString(Qt.locale("en_US"), "mm")
            if(alarmDialog.visible === true)
            {
                running = false
                hourSlider.update()
                minuteSlider.update()
                hourSlider.value = hour_Time
                minuteSlider.value = minute_Time
            }
            else if(alarmDialog.visible === false)
            {
                running = true
                hourSlider.update()
                minuteSlider.update()
                hourSlider.value = hour_Time
                minuteSlider.value = minute_Time
            }


        }
    }

//    function hour()
//    {
//        var hour = new Date()
//        var hour_Time = hour.toLocaleTimeString(Qt.locale("en_US"), "hh")
//        hourSlider.value = hour_Time
//        //return hour_Time
//    }
//    function minute()
//    {
//        var min = new Date()
//        var minute_Time = min.toLocaleTimeString(Qt.locale("en_US"), "mm")
//        minuteSlider.value = minute_Time
//        //return minute_Time
//    }

    //modal: true
    //standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
    background: Rectangle{
        width: 1101
        height: 688
        visible: true
        color: "black"
    }

    property AlarmListElement alarmModel

    Text {
        id: hours_text
        color: "white"
        visible: false
        text: {
            if(hourSlider.value<10)
            {
                if(hourSlider.value<6)
                {
                    night.visible = true
                    day.visible = false
                    night_animate.start()
                }
                else if(hourSlider.value>= 6 && hourSlider.value<10)
                {
                    night.visible = false
                    day.visible = true
                    day_animate.start()
                }
                return "0" + hourSlider.value
            }
            else if(hourSlider.value>=10)
            {
                if(hourSlider.value<18)
                {
                    night.visible = false
                    day.visible = true
                    day_animate.start()

                }
                else if(hourSlider.value>=18)
                {
                    night.visible = true
                    day.visible = false
                    night_animate.start()
                }
                return hourSlider.value
            }

        }
        font.pixelSize: 45
    }

    Text {
        id: semicolon
        visible: false
        color: "white"
        text: qsTr(":")
        font.pixelSize: 45
    }

    Text {
        id: minute_text
        x: 141
        y: 62
        width: 819
        height: 288
        color: "white"
        text:{
            if(minuteSlider.value<10)
                return "0" + minuteSlider.value
            else
                return minuteSlider.value
        }
        visible: false
        font.pixelSize: 45
    }
    Image {
        id: day
        width: 60
        height: 60
        visible: false
        NumberAnimation on y{
            id: day_animate
            to: 20; duration: 4000
        }
        source: "qrc:/figure/figure/day002.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Image {
        id: night
        width: 60
        height: 60
        visible: false
        NumberAnimation on y{
            id: night_animate
            to: 20; duration: 4000
        }
        source: "qrc:/figure/figure/night001.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Slider{
        id: hourSlider
        value: 0
        from: 0
        to: 23
        y: 283
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        stepSize: 1
        orientation: Qt.Horizontal
        background: Rectangle{
            id: bg01
            x:  hourSlider.visualPosition * (hourSlider.availableWidth - width)
            height: 5
            color: "white"
            implicitWidth: 600
            width: hourSlider.availableWidth //-(500/24) //ลบติ่ง
            anchors.centerIn: parent
        }

        handle: Rectangle{
            x: hourSlider.visualPosition * (hourSlider.availableWidth - width+12)
            implicitWidth: 100
            implicitHeight: 100
            radius: implicitWidth/2
            color: "black"
            border.color: "white"
            border.width: 5
            smooth: true
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 40
                text:{
                    if(hourSlider.value < 10)
                    {
                        return "0" + hourSlider.value
                    }
                    else
                        return hourSlider.value
                }
                //hourSlider.visualPosition * (hourSlider.availableWidth ) - height)//hourSlider.value//temperatureControlSlider.topPadding + temperatureControlSlider.bottomPadding +temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)//temperatureControlSlider.value
                font.family: robotoLight.name
            }
        }
        onValueChanged: {
            day_animate.from = 0
            day_animate.to = 20
            night_animate.from = 0
            night_animate.to = 20
        }
    }
    Text{
        id: hour_and_minute
        y: 10
        //height: 388 //Window.width/2.0 - width/2.0 - 20
        color: "white"

        text: hours_text.text + ":" + minute_text.text
        font.pixelSize: 200
        anchors.horizontalCenter: parent.horizontalCenter

        //anchors.horizontalCenter: parent.horizontalCenter
        //hours_text.text + ":" + minute_text.text
        //
    }
    Slider {
        id: minuteSlider
        y: 418
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        value: 0
        from: 0
        to: 59
        stepSize: 1
        orientation: Qt.Horizontal
        background: Rectangle{
            x:  minuteSlider.visualPosition * (minuteSlider.availableWidth - width)
            height: 5
            color: "white"
            implicitWidth: 600
            width: minuteSlider.availableWidth //-(500/24) //ลบติ่ง
            anchors.centerIn: parent
        }

        handle: Rectangle{
            x: minuteSlider.visualPosition * (minuteSlider.availableWidth - width+12)
            implicitWidth: 100
            implicitHeight: 100
            radius: implicitWidth/2
            color: "black"
            border.color: "white"
            border.width: 5
            smooth: true
            anchors.verticalCenter: parent.verticalCenter
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 40
                text: {
                    if(minuteSlider.value < 10)
                    {
                        return "0" + minuteSlider.value
                    }
                    else
                        return minuteSlider.value
                }//temperatureControlSlider.topPadding + temperatureControlSlider.bottomPadding +temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)//temperatureControlSlider.value
                font.family: robotoLight.name
            }

        }

    }
    RoundButton{
        id: ok_button
        y: 532
        width:  200
        height: 90
        anchors.horizontalCenterOffset: 150
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
            alarmModel.append({
                "hour": hourSlider.value,
                "minute": minuteSlider.value,
                "activated": true,
            })
            timer_run.running = true
            alarmDialog.close()
        }
    }
    RoundButton{
        id: cancel_button
        y: 532
        width:  200
        height: 90
        anchors.horizontalCenterOffset: -150
        anchors.horizontalCenter: parent.horizontalCenter
        background:Rectangle{
            id: rectangle
            width:  200
            height: 90
            radius: 50
            Text{
                color: "white"
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: "CANCEL"
                anchors.verticalCenter: parent.verticalCenter
            }
            color:{
                if(cancel_button.down)
                    return "grey"
                else
                    return "black"
            }
            border.color: "white"
            border.width: 5
        }
        onClicked: {
            timer_run.running = true
            alarmDialog.close()
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
