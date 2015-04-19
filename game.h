#ifndef GAME_H
#define GAME_H

#include "task.h"
#include "taskvideo.h"
#include "taskannotation.h"
#include "mode.h"

#include <QObject>
#include <QVector>

class Game : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject *currentTask READ getCurrentTask NOTIFY currentTaskChanged)
    Q_PROPERTY(QObject *currentVideoTask READ getCurrentVideoTask NOTIFY currentVideoTaskChanged)
    Q_PROPERTY(QObject *currentAnnotationTask READ getCurrentAnnotationTask NOTIFY currentAnnotationTaskChanged)
    Q_PROPERTY(int points READ getPoints NOTIFY pointsChanged)
    Q_PROPERTY(int multiplier READ getMultiplier NOTIFY multiplierChanged)
    Q_PROPERTY(bool finished READ isFinished NOTIFY finishedChanged)
    Q_PROPERTY(int tasksAnswered MEMBER m_tasksAnswered NOTIFY tasksAnsweredChanged)
    Q_PROPERTY(int maxPoints MEMBER m_maxPoints NOTIFY maxPointsChanged)
    Q_PROPERTY(int tasksAnsweredCorrectly MEMBER m_tasksAnsweredCorrectly NOTIFY tasksAnsweredChanged)
    Q_PROPERTY(Mode::Type mode MEMBER m_mode CONSTANT)

public:
    explicit Game(Mode::Type mode, QObject *parent = nullptr);
    int getPoints() const;
    int getMultiplier() const;
    Task* getCurrentTask();
    TaskVideo* getCurrentVideoTask();
    TaskAnnotation* getCurrentAnnotationTask();
    bool isFinished() const;
    void addPoints(int pointsToBeAdded);
    Mode::Type getMode();

public slots:
    void newTask();
    void newVideoTask();
    void newAnnotationTask();
    void onTaskAnswered();
    void onVideoTaskAnswered();
    void onAnnotationTaskAnswered();

signals:
    void currentTaskChanged(Task* newValue);
    void currentVideoTaskChanged(TaskVideo* newValue);
    void currentAnnotationTaskChanged(TaskAnnotation* newValue);
    void pointsChanged(int newValue);
    void multiplierChanged(int newValue);
    void finishedChanged(bool newValue);
    void tasksAnsweredChanged(int newValue);
    void maxPointsChanged(int newValue);

private:
    void setPoints(int newValue);
    void setMultiplier(int newValue);
    void setFinished(bool newValue);
    void setMaxPoints();

    Task* m_currentTask;
    TaskVideo* m_currentVideoTask;
    TaskAnnotation* m_currentAnnotationTask;
    int m_points;
    int m_multiplier;
    int m_tasksAnswered;
    int m_tasksAnsweredCorrectly;
    int m_maxPoints;
    const Mode::Type m_mode;
};

#endif // GAME_H
