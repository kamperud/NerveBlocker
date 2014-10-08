#include "gamehandler.h"
#include <QDebug>


GameHandler::GameHandler(QObject *parent) :
    QObject(parent){}

bool GameHandler::isNerve(int x, int y){
    qDebug()<<"x: "<<x<<" y: "<<y<<"\n";
    // We should use http://lodev.org/lodepng/ for the image checking
    // the x and y are the actual picture coordinates. no need to translate screen size and whatnot
    return true;
}

