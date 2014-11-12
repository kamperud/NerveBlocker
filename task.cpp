#include "task.h"

#include <array>

Task::Task(TaskType taskType, int imageId, QObject* parent) :
    QObject(parent),
    m_taskType(taskType),
    m_ultraSoundImage(imageId),
    m_answered(false),
    m_correct(false)
{}

bool Task::answerTask(int x, int y)
{
    m_answered = true;
    m_correct = m_ultraSoundImage.hasOrganTypeAtPosition(x, y, m_taskType);
    return m_correct;
}

Task Task::createRandomTask(QObject *parent = nullptr)
{
    const std::array<int, 15+1> supportsFemur = { //TODO: cleanup
        false, //doesn't exist
        true,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    };

    int taskId = (rand() % MAX_IMAGES)+1;

    Task::TaskType taskType(Task::ARTERY);
    do {
        taskType = rand() % Task::NUM_TYPES;
    } while(taskType == FEMUR && supportsFemur[taskId] == false);

    return Task(taskType, taskId, parent);
}
