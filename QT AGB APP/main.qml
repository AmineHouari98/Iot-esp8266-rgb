import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import QtQuick.Dialogs 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")



    ColorDialog {
        id: colorDialog
        title: "Please choose a color"

        onCurrentColorChanged: myNetwork.sendRGB(currentColor)

        onAccepted: {
            console.log("You chose: " + colorDialog.color)
            Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
        Component.onCompleted: visible = true

    }
}
