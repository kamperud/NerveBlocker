#include "ultrasoundimage.h"
#include "task.h"

#include <QImage>

UltraSoundImage::UltraSoundImage(int imageId, QObject *parent) :
    QObject(parent),
    m_imageId(imageId)
{}

QString UltraSoundImage::getImagePath() const
{
    return QString("gameImages/%1a.png").arg(m_imageId);
}

QString UltraSoundImage::getAnnotatedImagePath() const
{
    return QString("gameImages/%1.png").arg(m_imageId);
}

QString UltraSoundImage::getMappedImagePath() const
{
    return QString("gameImages/%1_map.png").arg(m_imageId);
}

bool UltraSoundImage::hasOrganTypeAtPosition(int x, int y, Organ::Type organ) const
{
    QImage img(":"+getMappedImagePath(), "PNG");

    switch (organ) {
        case Organ::NERVE:
            return img.pixel(x,y) == qRgb(255,255,0); //yellow
        case Organ::ARTERY:
            return img.pixel(x,y) == qRgb(255,0,0);   //red
        case Organ::ILIACA:
            return img.pixel(x,y) == qRgb(255,0,255); //pink-purple
        case Organ::LATA:
            return img.pixel(x,y) == qRgb(0,255,255); //cyan
        case Organ::FEMUR:
            return img.pixel(x,y) == qRgb(0,255,0);   //green
        default:
            return false;
    }
}
