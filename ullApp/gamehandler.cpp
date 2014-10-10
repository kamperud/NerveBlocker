#include "gamehandler.h"
#include <QDebug>
#include <QImage>
#include <QFileInfo>


GameHandler::GameHandler(QObject *parent) :
    QObject(parent){}

bool GameHandler::isNerve(int x, int y, int width, int height){
    qDebug()<<"x: "<<x<<" y: "<<y<<"\n";

//    QImage *img = new QImage();
//    const QString fileName = "/home/hannapus/1_map.png";
////    QFileInfo *f = new QFileInfo(fileName);

//    bool b = img->load(fileName, "PNG");
////    qDebug()<<"Exists er: "<<f->exists()<<"\n";
////    qDebug()<<"Load er: "<<b<<" isNull er: "<<img->isNull()<<"\n";
//    qDebug()<<img->pixel(x,y)<<"\n";
//    if (img->pixel(x,y) == qRgb(0,255,255))
//        return true;

    return true;
}
