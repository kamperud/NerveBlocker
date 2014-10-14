#ifndef PLATFORMDETAILES_H
#define PLATFORMDETAILES_H

#include <QObject>

class PlatformDetailes : public QObject
{
    Q_OBJECT
    Q_PROPERTY (bool isIos READ isIos CONSTANT)

public:
    PlatformDetailes(QObject*parent =0);
    Q_INVOKABLE bool isIos();
};

#endif // PLATFORMDETAILES_H


