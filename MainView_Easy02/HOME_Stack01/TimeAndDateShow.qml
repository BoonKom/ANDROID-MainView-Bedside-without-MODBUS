import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import QtMultimedia
import "../ALARM_Stack04"
Item {
    width: 1101
    height: 638

    AlarmNotificate{
        id: alarm_wake
        x: mainWindow.width/2.0 - width/2.0
        y: mainWindow.height/2.0 - width/2.0

    }

    SoundEffect{
            id: playSound
            source: "qrc:/sound/sound_alarm.wav"
        }
    function find_Alarm_Element(a)
        {
            for(var i=0;i<a;i++)
            {
                if(i>=0)
                {
                    var hour = new Date()
                    var min = new Date()
                    var hour_Alarm = alarm_was_set.get(i).hour
                    var minute_Alarm = alarm_was_set.get(i).minute
                    var hour_Time = hour.toLocaleTimeString(Qt.locale("en_US"), "hh")
                    var minute_Time = min.toLocaleTimeString(Qt.locale("en_US"), "mm")
                    if(alarm_was_set.get(i).activated === true)
                    {
                        console.log(alarm_was_set.get(i).hour)
                        //console.log(hour.toLocaleTimeString(Qt.locale("en_US"), "hh"))
                        if(hour.toLocaleTimeString(Qt.locale("en_US"), "hh")<10)
                        {
                            if("0"+hour_Alarm=== ""+hour_Time)
                            {
                                if(min.toLocaleTimeString(Qt.locale("en_US"), "mm")<10)
                                {
                                    if("0"+minute_Alarm=== ""+(minute_Time))
                                    {
                                        alarm_wake.open()
                                        alarm_was_set.get(i).activated=false
                                        playSound.play();
                                    }
                                }
                                else
                                {
                                    if(""+minute_Alarm=== ""+(minute_Time))
                                    {
                                        alarm_wake.open()
                                        alarm_was_set.get(i).activated=false
                                        playSound.play();

                                    }
                                }
                            }

                        }
                        else if(hour.toLocaleTimeString(Qt.locale("en_US"), "hh")>10)
                        {
                            if(""+hour_Alarm=== ""+hour_Time)
                            {
                                console.log("Ho")
                                console.log(minute_Time)
                                if(""+minute_Alarm=== ""+(minute_Time))
                                {
                                    console.log("WAKE")
                                    alarm_wake.open()
                                    alarm_was_set.get(i).activated=false
                                    playSound.play();

                                }
                                else if("0"+minute_Alarm=== ""+(minute_Time))
                                {
                                    console.log("WAKE")
                                    alarm_wake.open()
                                    alarm_was_set.get(i).activated=false
                                    playSound.play();
                                }
                            }

                        }
                    }
                }
            }
        }

    Rectangle{
        id: rectangle
        width: 1101
        height: 638
        color: "black"
        Text {
                id: showTime
                y: window.height/2.0 - showTime.height/2.0 - 200
                height: 59
                text: qsTr("Time")
                //fontSizeMode: Text.Fit
                Layout.fillWidth: true
                color: "#E56717"//"#D9E2EC"
                style: Text.Normal
                font.bold: true
                wrapMode: Text.NoWrap
                anchors.horizontalCenter: parent.horizontalCenter
                font.weight: Font.Normal
                font.pointSize: 100
                horizontalAlignment: Text.AlignHCenter
                font{
                    family: "PibotoLt"
                }
        }

        Text {
                id: showDate
                text: qsTr("Date")
                anchors.verticalCenter: parent.verticalCenter
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true

                style: Text.Normal
                font.bold: true
                font.weight: Font.Normal
                font.pointSize: 27
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenterOffset: -100
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#E56717"//"#D9E2EC"
                font{
                    family: "PibotoLt"
                }
         }
    }
    Timer{
           interval: 500
           running: true
           repeat: true
           onTriggered: {
               var date = new Date()
               showTime.text = date.toLocaleTimeString(Qt.locale("en_US"), "hh:mm:ss")
               showDate.text = date.toLocaleDateString(Qt.locale("en_US"))
               find_Alarm_Element(alarmListView.count)
               //find_Alarm_Element(alarmListMainView.count)

           }
       }

}

