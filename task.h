#ifndef TASK_H
#define TASK_H

#include <QObject>

#include "ultrasoundimage.h"

class Task: public QObject
{
public:
    explicit Task(TaskType taskType, int imageId, QObject *parent = nullptr);
    enum TaskType {
        FEMUR,
        NERVE,
        ARTERY,
        LATA,
        ILIACA,
        NUM_TYPES // number of enum elements
    };
    Q_ENUMS(TaskType)
    static Task createRandomTask();

public slots:
    bool answerTask(int x, int y);

private:
    TaskType m_taskType;
    UltraSoundImage m_ultraSoundImage;
    bool m_answered;
    bool m_correct;
};

#endif // TASK_H
