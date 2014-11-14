#include "task.h"
#include "constants.h"

#include <array>

Task::Task(Organ::Type organ, int imageId, QObject* parent) :
    QObject(parent),
    m_taskType(organ),
    m_ultraSoundImage(new UltraSoundImage(imageId, this)),
    m_answered(false),
    m_correct(false)
{}

bool Task::answerTask(int x, int y)
{
    m_answered = true;
    m_correct = m_ultraSoundImage->hasOrganTypeAtPosition(x, y, m_taskType);
    return m_correct;
}

Task *Task::createRandomTask(QObject *parent)
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

    Organ::Type organ(Organ::ARTERY);
    do {
        organ = Organ::Type(rand() % Organ::NUM_TYPES);
    } while(organ == Organ::FEMUR && supportsFemur[taskId] == false);

    return new Task(organ, taskId, parent);
}
