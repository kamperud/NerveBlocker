#ifndef GAME_H
#define GAME_H

#include "task.h"
#include "mode.h"

#include <QObject>

class Game : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject *currentTask READ getCurrentTask NOTIFY currentTaskChanged)
    Q_PROPERTY(int points READ getPoints NOTIFY pointsChanged)
    Q_PROPERTY(int multiplier READ getMultiplier NOTIFY multiplierChanged)
    Q_PROPERTY(bool finished READ isFinished NOTIFY finishedChanged)
    Q_PROPERTY(int tasksAnswered MEMBER m_tasksAnswered NOTIFY tasksAnsweredChanged)
    Q_PROPERTY(Mode::Type mode MEMBER m_mode CONSTANT)

public:
    explicit Game(Mode::Type mode, QObject *parent = nullptr);
    int getPoints() const;
    int getMultiplier() const;
    Task* getCurrentTask();
    bool isFinished() const;
    void addPoints(int pointsToBeAdded);
    Mode::Type getMode();

public slots:
    void newTask();
    void onTaskAnswered();

signals:
    void currentTaskChanged(Task* newValue);
    void pointsChanged(int newValue);
    void multiplierChanged(int newValue);
    void finishedChanged(bool newValue);
    void tasksAnsweredChanged(int newValue);

private:
    void setPoints(int newValue);
    void setMultiplier(int newValue);

    Task* m_currentTask;
    int m_points;
    int m_multiplier;
    int m_tasksAnswered;
    const Mode::Type m_mode;

};

#endif // GAME_H
