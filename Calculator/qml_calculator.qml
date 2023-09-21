import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: element
    width: 420
    height: 520

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.Stretch
        source: "image/light_background.jpg"
    }
    states: [
        State {
            name: "State1"
        }
    ]

}

/*##^##
Designer {
    D{i:1;anchors_x:16;anchors_y:-21}
}
##^##*/
