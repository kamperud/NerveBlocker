#include "ultrasoundimage.h"
#include "task.h"

#include <QImage>

UltraSoundImage::UltraSoundImage(int imageId, QObject *parent) :
    QObject(parent),
    m_imageId(imageId)
{}

QString UltraSoundImage::getImagePath() const
{
    return QString("gameImages/%1.png").arg(m_imageId);
}

QString UltraSoundImage::getMappedImagePath() const
{
    return QString("gameImages/%1_map.png").arg(m_imageId);
}

bool UltraSoundImage::hasOrganTypeAtPosition(int x, int y, Organ::Type organ) const
{
    switch (organ) {
        case Organ::NERVE:
            return hasColorInArea(x, y, qRgb(255,255,0), 10); //yellow
        case Organ::ARTERY:
            return hasColorInArea(x, y, qRgb(255,0,0), 10);   //red
        case Organ::ILIACA:
            return hasColorInArea(x, y,qRgb(255,0,255), 12); //pink-purple
        case Organ::LATA:
            return hasColorInArea(x, y, qRgb(0,255,255), 12); //cyan
        case Organ::FEMUR:
            return hasColorInArea(x, y,qRgb(0,255,0), 25);   //green
        default:
            return false;
    }
}

bool UltraSoundImage::hasColorInArea(int x, int y, QRgb color, int radius) const{
    QImage img(":"+getMappedImagePath(), "PNG");

    for(int i = x-radius; i < x+radius; ++i){
        for(int k = y-radius; k < y+radius; ++k){

            if(!img.valid(i,k) || radius*radius < (i-x)*(i-x) + (k-y)*(k-y))
                continue;

            if(img.pixel(i, k) == color)
                return true;

        }
    }

    return false;
}





