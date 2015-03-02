#ifndef TASK_H
#define TASK_H

#include <QObject>
#include <QList>

#include "ultrasoundimage.h"
#include "organ.h"

class Task: public QObject
{
    Q_OBJECT
    Q_PROPERTY(Organ::Type organ READ getOrgan CONSTANT)
    Q_PROPERTY(QObject* image READ getImage CONSTANT)
    Q_PROPERTY(bool answered MEMBER m_answered NOTIFY answeredChanged)
    Q_PROPERTY(bool correct MEMBER m_correct NOTIFY correctChanged)
    Q_PROPERTY(int score READ getScore NOTIFY scoreChanged)
public:
    explicit Task(Organ::Type organ, int imageId, QObject *parent = nullptr);
    static Task* createRandomTask(QObject* parent = nullptr);
    Organ::Type getOrgan() const;
    UltraSoundImage* getImage();
    bool isCorrect() const;
    int getScore();


public slots:
    bool answerTask(int x, int y);
    int answerAnnotation(QList<double> list);

signals:
    void answeredChanged(bool newValue);
    void correctChanged(bool newValue);
    void scoreChanged(bool newValue);

private:
    const Organ::Type m_organ;
    UltraSoundImage* m_image;
    bool m_answered;
    bool m_correct;
    int m_score;
};

#endif // TASK_H
