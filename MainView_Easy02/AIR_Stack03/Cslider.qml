import QtQuick 2.0
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Material 2.0
import "../object"

CircularSlider{
    id: sldier
    x: 401
    y: 184
    value: handlePage.newVal
    onValueChanged: handlePage.newVal = value
    width: 300
    height: 300
    minValue: 0
    maxValue: 120
    startAngle: 40
    trackColor: "white"
    trackWidth: 10
    progressWidth: 15
    progressColor: "green"
    endAngle: 320
    rotation: 180
    handle: Rectangle {
        id: handleItem
        transform: Translate {
            x: (sldier.handleWidth - width) / 2
            y: (sldier.handleHeight - height) / 2
        }
        width: 40
        height: 40
        radius: width / 2
        antialiasing: true
        color: "#908990"

        border.color: "#fefefe"
        border.width: 5

    }
    snap: true
    Label {
        anchors.centerIn: parent
        font.pointSize: 26
        rotation: 180
        color: "#FEFEFE"
        text: Number(sldier.value).toFixed()
    }
}
