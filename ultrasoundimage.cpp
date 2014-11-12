#include "ultrasoundimage.h"

#include "task.h"

UltraSoundImage::UltraSoundImage(int imageId, QObject *parent) :
    QObject(parent),
    m_imageId(imageId)
{
}

QString UltraSoundImage::getImagePath() const
{
    return QString("/gameImages/%1a.png").arg(m_imageId);
}

QString UltraSoundImage::getAnnotatedImagePath() const
{
    return QString("/gameImages/%1.png").arg(m_imageId);
}

QString UltraSoundImage::getMappedImagePath() const
{
    return QString("/gameImages/%1.png").arg(m_imageId);
}

bool UltraSoundImage::hasOrganTypeAtPosition(int x, int y, Task::TaskType organType)
{
    QImage *img = new QImage(m_ultraSoundImage.getMappedImagePath(), "PNG");

    switch (organType) {
        case Task::NERVE:
            return img->pixel(x,y) == qRgb(255,255,0); //yellow
        case Task::ARTERY:
            return img->pixel(x,y) == qRgb(255,0,0);   //red
        case Task::ILIACA:
            return img->pixel(x,y) == qRgb(255,0,255); //pink-purple
        case Task::LATA:
            return img->pixel(x,y) == qRgb(0,255,255); //cyan
        case Task::FEMUR:
            return img->pixel(x,y) == qRgb(0,255,0);   //green
        default:
            return false;
    }
}
