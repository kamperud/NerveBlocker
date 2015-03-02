import QtQuick 2.0

MouseArea{
    visible: !taskConfirmed

    drag.maximumX: maxX
    drag.maximumY: maxY
    drag.minimumX: minX
    drag.minimumY: minY
    
}
