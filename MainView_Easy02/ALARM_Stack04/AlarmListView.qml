import QtQuick 2.0
import QtQuick.Window 2.10
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.11
ItemDelegate {
    id: root
    width: Window.width
    checkable: true
    background: Rectangle{
        color: "#404040"
        border.color: "#181818"
    }

    onClicked: ListView.view.currentIndex = index
    AlarmListElement{}
    contentItem: ColumnLayout {
        spacing: 0

        RowLayout {
            ColumnLayout {
                id: dateColumn

                readonly property date alarmDate: new Date(model.year, model.month - 1, model.day, model.hour, model.minute)

                Label {
                    id: timeLabel
                    x: 0
                    y: 0
                    font.pixelSize: 50
                    text: {
                        if(model.hour<10 || model.minute<10)
                        {
                            if(model.hour<10 && model.minute<10)
                                return "0" + model.hour + ":" + "0" + model.minute
                            if(model.hour<10)
                                return "0" + model.hour + ":" + model.minute
                            if(model.minute<10)
                                return model.hour + ":" + "0" + model.minute

                        }
                        else
                            return model.hour + ":" + model.minute
                    }
                    color: "white"
                }

            }
            Item {
                Layout.fillWidth: true
            }

            Slider{
                id: sw
                value: {
                    if(model.activated === true)
                        return 1
                    else
                        return 0
                }

                from: 0
                to: 1
                stepSize: 1
                orientation: Qt.Horizontal
                Layout.alignment: Qt.AlignCenter
                enabled: true
                anchors.right: parent
                        anchors.rightMargin: 100

                background: Rectangle{
                    x:  sw.visualPosition * (sw.availableWidth - width)
                    radius: 3
                    height: 10
                    color: {
                        if(sw.value === 0)
                            return "white"
                        else
                            return "green"
                    }
                    implicitWidth: 100
                    width: sw.availableWidth//ลบติ่ง
                    anchors.centerIn: parent
                }

                handle: Rectangle{
                    id: recHandle
                    x: sw.visualPosition * (sw.availableWidth - width +12) //12 มาจาก -> sw.visualPosition * (sw.availableWidth ) = 88 แสดงว่า ขาดอีก 12 จึงจะ = 100(มาจาก width ของ รางเลื่อน) ดังนั้น ต้อง + 12 เพื่อชดเชย
                    implicitWidth:  50
                    implicitHeight: 50
                    radius: width/2
                    color: "black"
                    border.color: "white"
                    border.width: 2
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                         anchors.centerIn: parent
                         color: "white"
                         font.pixelSize: 25
                         text: {
                             if(sw.value ===0)
                                 return  "Off"
                             else
                                 return "On"//sw.visualPosition * (sw.availableWidth) //
                         }
                         font.family: robotoLight.name
                    }
                }
                onValueChanged: {
                    if(sw.value === 1)
                        model.activated = true

                }
            }
            Button {
                id: deleteAlarmButton
                text: qsTr("Delete")
                width: 40
                height: 40
                visible: root.checked
                background: Rectangle{
                    color: "#00897B"
                }
                onClicked: root.ListView.view.model.remove(root.ListView.view.currentIndex, 1)
            }
        }



    }

}
