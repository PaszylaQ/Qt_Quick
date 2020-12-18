import QtQuick 2.0
import QtQuick.Window 2.0
import myType.Controller 1.0


Grid {


    property int count: 0
    property var arrayOfTokens: []

    height: parent.height*5/6
    width: parent.width
    columns: 7
    rows: 6
    z: 1
    property var colors: ['red', 'yellow']
    property var currColor: 0

    Repeater {
        model: 42
        Slot {
        }
    }

    function clear() {
        for(var i = 0; i < count; ++i) {
            arrayOfTokens[i].destroy()
        }
        count = 0;
    }


}
