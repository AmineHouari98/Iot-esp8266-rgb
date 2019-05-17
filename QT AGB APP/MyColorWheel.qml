import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item{
    property color colorValue: hsba(hueSlider.value, colorPicker.saturation,
                                        colorPicker.brightness, 1.0)

        id: colorDialog


        //  creates color value from hue, saturation, brightness, alpha
        function hsba(h, s, b, a) {
            var lightness = (2 - s)*b;
            var satHSL = s*b/((lightness <= 1) ? lightness : 2 - lightness);
            lightness /= 2;
            return Qt.hsla(h, satHSL, lightness, a);
        }

         Column {
            width: parent.width
            height: parent.height

            Item {
                id: colorPicker
                property color hueColor : hsba(hueSlider.value, 1.0, 1.0, 1.0)
                property real saturation : pickerCursor.x/width
                property real brightness : 1 - pickerCursor.y/height

                anchors.verticalCenter: parent.verticalCenter
                width: 400; height: 400

                Rectangle {
                    anchors.fill: parent;
                    rotation: -90
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#FFFFFF" }
                        GradientStop { position: 1.0; color: colorPicker.hueColor }
                    }
                }
                Rectangle {
                    anchors.fill: parent
                    gradient: Gradient {
                        GradientStop { position: 1.0; color: "#FF000000" }
                        GradientStop { position: 0.0; color: "#00000000" }
                    }
                }
                Item {
                    id: pickerCursor
                    property int r : 8
                    Rectangle {
                        x: -parent.r; y: -parent.r
                        width: parent.r*2; height: parent.r*2
                        radius: parent.r
                        border.color: "black"; border.width: 2
                        color: "transparent"
                        Rectangle {
                            anchors.fill: parent; anchors.margins: 2;
                            border.color: "white"; border.width: 2
                            radius: width/2
                            color: "transparent"
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    function handleMouse(mouse) {
                        if (mouse.buttons & Qt.LeftButton) {
                            pickerCursor.x = Math.max(0, Math.min(width,  mouse.x));
                            pickerCursor.y = Math.max(0, Math.min(height, mouse.y));
                        }
                    }
                    onPositionChanged: handleMouse(mouse)
                    onPressed: handleMouse(mouse)
                }
            }

            Slider {
                id: hueSlider
                width: 100
                anchors.horizontalCenter: parent.horizontalCenter

                style: SliderStyle {

                groove: Rectangle {
                    height: parent.width / 4
                    width: parent.height / 2
                    rotation: 90
                    radius: 4
                    anchors.centerIn: parent
                    gradient: Gradient {

                        GradientStop { position: 1.0;  color: "#FF0000" }
                        GradientStop { position: 0.85; color: "#FFFF00" }
                        GradientStop { position: 0.76; color: "#00FF00" }
                        GradientStop { position: 0.5;  color: "#00FFFF" }
                        GradientStop { position: 0.33; color: "#0000FF" }
                        GradientStop { position: 0.16; color: "#FF00FF" }
                        GradientStop { position: 0.0;  color: "#FF0000" }
                    }
                }

                }
            }


        }


}
