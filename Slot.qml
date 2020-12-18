import QtQuick 2.4
import QtGraphicalEffects 1.12

Item {
    id: root

    height: parent.height / 6
    width: height

    Rectangle {
        id: rect

        anchors.fill: root
        height: root.height
        width: root.width
        color: "blue"
        visible: false

    }

    OpacityMask {
        anchors.fill: root
        source: rect
        maskSource:
            Circle {
                radius: (rect.height / 2)
                visible: false
            }
        invert: true
    }
}
