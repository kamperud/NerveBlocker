#ifndef ULTRASOUNDIMAGE_H
#define ULTRASOUNDIMAGE_H

#include <QObject>

class UltraSoundImage : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ getImagePath CONSTANT)
    Q_PROPERTY(QString annotatedImagePath READ getAnnotatedImagePath CONSTANT)
    Q_PROPERTY(QString mappedImagePath READ getMappedImagePath CONSTANT)
public:
    explicit UltraSoundImage(int imageId, QObject *parent = nullptr);

signals:

public slots:
    QString getImagePath() const;
    QString getAnnotatedImagePath() const;
    QString getMappedImagePath() const;
    bool hasOrganTypeAtPosition(int x, int y, Task::TaskType organType);

private:
    const int m_imageId;

};

#endif // ULTRASOUNDIMAGE_H
