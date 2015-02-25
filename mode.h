#ifndef MODE_H
#define MODE_H

#include <QObject>

class Mode : public QObject
{
    Q_OBJECT
public:
    enum Type{
        TUTORIAL,
        NORMAL,
        TIMED,
        VIDEO,
        DRAG,
        NONE
    };
    Q_ENUMS(Type)
    explicit Mode(QObject *parent = 0);
};

#endif // MODE_H
