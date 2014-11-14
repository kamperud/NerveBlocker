#ifndef GAME_H
#define GAME_H

#include <QObject>

class Task;

class Game : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Task *currentTask READ getCurrentTask NOTIFY currentTaskChanged)
    Q_PROPERTY(int points READ getPoints NOTIFY pointsChanged)
    Q_PROPERTY(int multiplier READ getMultiplier NOTIFY multiplierChanged)
public:
    explicit Game(QObject *parent = nullptr);
    int getPoints() const;
    int getMultiplier() const;
    Task* getCurrentTask();

public slots:
    void newTask();

signals:
    void currentTaskChanged(Task* newValue);
    void pointsChanged(int newValue);
    void multiplierChanged(int newValue);

private:
    void setPoints(int newValue);
    void setMultiplier(int newValue);

    Task* m_currentTask;
    int m_points;
    int m_multiplier;

};

#endif // GAME_H
