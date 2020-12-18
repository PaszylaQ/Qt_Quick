import QtQuick 2.0


Rectangle {
    id: root

    anchors.left: parent.left
    anchors.right: gameBoard.right
    anchors.bottom: parent.bottom
    anchors.top: gameBoard.bottom
    width: gameBoard.width

    color: "white"
    Text {
        text: qsTr('New Game')
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        anchors.fill: parent
        font.pointSize: 60

    }
}
