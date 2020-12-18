import QtQuick 2.4
import QtQuick.Window 2.0
import myType.Controller 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.0

Rectangle {
    id: token

    property int row: 0
    property int column: 0
    height: 2 * radius
    width: 2 * radius
    radius: gameBoard.height / 12

    x: column * gameBoard.width / 7
    y: row * (gameBoard.height / 6)

    NumberAnimation on y {
        from: 0
        to: row * (gameBoard.height / 6)
        duration: 100 * row
        easing.type: Easing.InOutQuad
    }

}
