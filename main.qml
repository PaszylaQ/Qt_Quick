import QtQuick 2.4
import QtQuick.Window 2.0
import myType.Controller 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.0

Window {
    id: window
    visible: true
    width: 465
    height: 480
    title: qsTr("Four In A Row")
    minimumHeight: 480
    minimumWidth: 465



    GameBoard {
        id: gameBoard
    }

    MouseArea {
        id: mouse
        anchors.fill: gameBoard
        onClicked: {
            var positionInBoard = mapToItem(gameBoard, mouse.x, mouse.y)
            var column = Math.floor(positionInBoard.x / (gameBoard.width / 7))
            controller.tryToDropTokenInColumn(column)
        }
    }

    Controller {
        id: controller

        property Component tokenComponent: Token {}

        onDropToken: {
            var to = row * (gameBoard.height / 6)
            var x = column * (gameBoard.width / 7)
            var prop = 'y'
            var color = gameBoard.colors[gameBoard.currColor]
            var token = tokenComponent.createObject(window, {row: row, column: column, color: color})
            gameBoard.arrayOfTokens[gameBoard.count] =  token
            gameBoard.count++
        }

        onPlayerChanged: {
            gameBoard.currColor = (gameBoard.currColor + 1) % 2
        }

        onCurrPlayerWin: {
            messageDialog.text = gameBoard.colors[gameBoard.currColor] + " is the winner"
            messageDialog.visible = true;
        }

        onGameStopped: {
            messageDialog.text = "No more moves!"
            messageDialog.visible = true;
        }


    }

    MessageDialog {
        id: messageDialog
        title: "Four In A Row"
        onAccepted: {
            messageDialog.visible = false
            controller.continueGame()
            gameBoard.clear()
        }
    }

    NewGameButton {
        id: newGameButton
    }

    MouseArea {
        id: newGame
        anchors.fill: newGameButton
        onClicked: {
            controller.reset();
            gameBoard.clear()
        }
    }

}
