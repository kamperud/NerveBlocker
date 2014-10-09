#include "gamehandler.h"
#include <QDebug>
#include <QImage>


GameHandler::GameHandler(QObject *parent) :
    QObject(parent){}

bool GameHandler::isNerve(int x, int y){
    qDebug()<<"x: "<<x<<" y: "<<y<<"\n";
    // We should use http://lodev.org/lodepng/ for the image checking
    // the x and y are the actual picture coordinates. no need to translate screen size and whatnot

    QImage *img = new QImage();
    QString fileName = "gameImages/1_map.png";
    bool isLoaded = img->load(fileName);

    if (img->pixel(x,y) == qRgb(0,255,255))
        return true;

    return false;
}
