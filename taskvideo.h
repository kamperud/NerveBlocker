#ifndef TASKVIDEO_H
#define TASKVIDEO_H

#include <QObject>
#include <QVector>

class TaskVideo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString videoPath READ getVideoPath CONSTANT)
    Q_PROPERTY(int score READ getScore NOTIFY scoreChanged)
    Q_PROPERTY(bool answered MEMBER m_answered NOTIFY answeredChanged)
    Q_PROPERTY(QList<int> startValues READ getStartValues CONSTANT)
    Q_PROPERTY(QList<int> endValues READ getEndValues CONSTANT)


public:
    explicit TaskVideo(QObject *parent = 0);
    QString getVideoPath() const;
    int getScore() const;
    int getMaxScore() const;
    QList<int> getStartValues() const;
    QList<int> getEndValues() const;


signals:
    void scoreChanged(int newValue);
    void answeredChanged(bool newValue);

public slots:
    int answerVideoTask(int timeSpot);

private:
    QVector<int> m_timeSpots;
    int m_score;
    bool m_answered;
    QList<int> m_start;
    QList<int> m_end;

};

#endif // TASKVIDEO_H
