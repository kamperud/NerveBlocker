#ifndef ORGAN_H
#define ORGAN_H

#include <QObject>

//has to be a class and not a bare enum to play nice with qml
class Organ : public QObject
{
    Q_OBJECT
public:
    enum Type {
        FEMUR,
        NERVE,
        ARTERY,
        LATA,
        ILIACA,
        NUM_TYPES // number of enum elements
    };
    Q_ENUMS(Type)
    explicit Organ(QObject *parent = 0);
signals:

public slots:

};

#endif // ORGAN_H
