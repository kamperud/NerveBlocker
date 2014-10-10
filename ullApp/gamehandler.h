#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include <QObject>

class GameHandler : public QObject
{
    Q_OBJECT
public:
    GameHandler(QObject *parent = 0);
    Q_INVOKABLE static bool isNerve(int x, int y, int width, int height);

signals:

public slots:

};

#endif // GAMEHANDLER_H
