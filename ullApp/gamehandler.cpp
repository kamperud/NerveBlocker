#include "gamehandler.h"
#include <QDebug>
#include <QImage>
#include <QFileInfo>
#include <QResource>



GameHandler::GameHandler(QObject *parent) :
    QObject(parent){}

bool GameHandler::isNerve(int x, int y, int width, int height){
    qDebug()<<"x: "<<x<<" y: "<<y<<"\n";
    QResource::registerResource("");

    const QString fileName = "/home/hannapus/1_map.png";
    //const QString fileName = "/Users/solveighellan/Master/application/Ultrasound-App/ullApp/gameImages/1_map.png";
    QImage *img = new QImage(fileName, "PNG");

    int newX = img->width()*x/width;
    int newY = img->height()*y/height;

    return img->pixel(newX,newY) == qRgb(255,255,0);


}

bool GameHandler::isFemoralArtery(int x, int y, int width, int height){

    //const QString fileName = "/home/hannapus/1_map.png";
    QImage *img = new QImage(fileName, "PNG");

    int newX = img->width()*x/width;
    int newY = img->height()*y/height;

    return img->pixel(newX,newY) == qRgb(255,0,0);
}

bool GameHandler::isFasciaIliaca(int x, int y, int width, int height){

    //const QString fileName = "/home/hannapus/1_map.png";
    QImage *img = new QImage(fileName, "PNG");

    int newX = img->width()*x/width;
    int newY = img->height()*y/height;

    return img->pixel(newX,newY) == qRgb(255,0,255);
}

bool GameHandler::isFemur(int x, int y, int width, int height){

    //const QString fileName = "/home/hannapus/1_map.png";
    QImage *img = new QImage(fileName, "PNG");

    int newX = img->width()*x/width;
    int newY = img->height()*y/height;

    return img->pixel(newX,newY) == qRgb(0,255,0);
}
