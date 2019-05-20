import QtQuick 2.12
import QtQuick.Window 2.12
import CustomControls 1.0
import QtQuick.Layouts 1.12

Window {
    id: appwin
    visible: true
    width: 576
    height: 922
    title: qsTr("Home Auto")
    // TOFIX RD: fixed window size !
//    maximumHeight: 992
//    maximumWidth: 576

    property int columns : 1
    property int rows : 1

    Rectangle {
        anchors.fill: parent
        color: "#09102B"
    }

    GridView {
        id: grid
        anchors.fill: parent
        cellWidth: Math.max(width / 3, height/3);
        cellHeight: Math.max(width / 3, height/3)
        model: dashModel
        delegate : Rectangle {
            Layout.alignment: Layout.Center
            width: grid.cellWidth
            height: grid.cellHeight
            color: "#09102b"
            border.color: "#000000"
            border.width: 3

            Text {
                id: name
                text: tagName
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 10
                anchors.topMargin: 10
                font.pointSize: 13
                color: "#FAFAFA"
            }

            SpiralBar {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter:  parent.verticalCenter
                width: parent.width / 1.4
                height: width
                penStyle: Qt.RoundCap
                progressColor: "#41cd52"
                foregroundColor: "#3a4055"
                dialWidth: 30
                dialType: SpiralBar.FullDial
                minValue: minVal
                maxValue: maxVal
                startAngle: 180
                value: actVal
                suffixText: suffix
                textFont {
                    family: "Halvetica"
                    italic: false
                    pointSize: 38
                }
                textColor: "#00ffc1"
            }
        }
        onWidthChanged: {
            grid.cellWidth = grid.width/appwin.columns;
        }

        onHeightChanged: {
            grid.cellHeight = grid.height/appwin.rows
        }

        Rectangle {
            id: topmenu
            x: 0
            y: 0
            width: 576
            height: 235
            color: "#09102b"
            z: 1

            Text {
                id: element
                x: 8
                y: 154
                width: 560
                height: 56
                color: "#fff7f7"
                text: qsTr("Grinding..")
                horizontalAlignment: Text.AlignHCenter
                lineHeight: 1.8
                fontSizeMode: Text.HorizontalFit
                font.pixelSize: 48
            }

            Rectangle {
                id: seprator
                x: 0
                y: 231
                width: 576
                height: 1
                color: "#393f55"
                border.color: "#393f55"
            }

            Rectangle {
                id: seprator2
                x: 0
                y: 735
                width: 576
                height: 1
                color: "#393f55"
                border.color: "#393f55"
            }

            Image {
                id: plates_img
                x: 21
                y: 42
                width: 68
                height: 81
                fillMode: Image.PreserveAspectFit
                source: "ASSETS/COMMON/plate_rep_with_rect.png"
            }

            Image {
                id: food_img1
                x: 101
                y: 42
                width: 68
                height: 81
                fillMode: Image.PreserveAspectFit
                source: "ASSETS/COMMON/food_rep_with_rect.png"
            }
        }

        Rectangle {
            id: seprator1
            x: 0
            y: 231
            width: 576
            height: 4
            color: "#393f55"
            border.color: "#393f55"
        }
    }

    ListModel {
        id: dashModel
        ListElement {
            tagName: "Time"
            minVal: 0
            maxVal: 100
            actVal: 10
            suffix: "\""
        }
        ListElement {
            tagName: "Load"
            minVal: 0
            maxVal: 1000
            actVal: 425
            suffix: " mAmp"
        }
        ListElement {
            tagName: "Power"
            minVal: 0
            maxVal: 15
            actVal: 12.65
            suffix: " V"
        }

    }

    Rectangle {
        id: rectangle
        x: 0
        y: 739
        width: 576
        height: 183
        color: "#09102b"
    }

    Image {
        id: cook_img1
        x: 181
        y: 42
        width: 68
        height: 81
        fillMode: Image.PreserveAspectFit
        source: "ASSETS/COMMON/cook_rep_with_no_rect.png"
    }

    Image {
        id: nutri_img2
        x: 260
        y: 42
        width: 68
        height: 81
        fillMode: Image.PreserveAspectFit
        source: "ASSETS/COMMON/nutrition_rep_with_rect.png"
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: appwin.height
        width: appwin.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: appwin.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
