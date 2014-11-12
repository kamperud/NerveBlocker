#ifndef GAME_H
#define GAME_H

#include <QObject>

class Task;

class Game : public QObject
{
public:
    Game();

public slots:
    void newTask();

private:
    Task current_task;
    int m_points;
    int m_multiplier;

};

#endif // GAME_H
