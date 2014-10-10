#include "gamehandler.h"
#include <QDebug>
#include <QImage>
#include <QFileInfo>


GameHandler::GameHandler(QObject *parent) :
    QObject(parent){}

bool GameHandler::isNerve(int x, int y, int width, int height){
    qDebug()<<"x: "<<x<<" y: "<<y<<"\n";

    const QString fileName = "/home/hannapus/1_map.png";
    // Solveig maa velge ny filpath
    QImage *img = new QImage(fileName, "PNG");

    int newX = img->width()*x/width;
    int newY = img->height()*y/height;

    return img->pixel(newX,newY) == qRgb(255,255,0);


}

