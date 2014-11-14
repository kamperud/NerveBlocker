#ifndef TASK_H
#define TASK_H

#include <QObject>

#include "ultrasoundimage.h"
#include "organ.h"

class Task: public QObject
{
public:
    explicit Task(Organ::Type organ = Organ::ILIACA, int imageId = 1, QObject *parent = nullptr);
    static Task* createRandomTask(QObject* parent = nullptr);

public slots:
    bool answerTask(int x, int y);

private:
    Organ::Type m_taskType;
    UltraSoundImage* m_ultraSoundImage;
    bool m_answered;
    bool m_correct;
};

#endif // TASK_H
