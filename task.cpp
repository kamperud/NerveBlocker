#include "task.h"
#include "constants.h"

#include <array>
#include <QList>
#include <QListIterator>
#include <QDebug>


Task::Task(Organ::Type organ, int imageId, QObject* parent) :
    QObject(parent),
    m_organ(organ),
    m_image(new UltraSoundImage(imageId, this)),
    m_answered(false),
    m_correct(false),
    m_score(0)
{}

bool Task::answerTask(int x, int y)
{
    m_answered = true;
    m_correct = m_image->hasOrganTypeAtPosition(x, y, m_organ);
    if(m_correct)emit correctChanged(m_correct);
    emit answeredChanged(m_answered);
    return m_correct;
}

bool Task::answerAnnotation(QList<double> listOfPoints)
{
    m_answered = true;
    m_correct = true;

    QListIterator<double> i(listOfPoints);
    while(i.hasNext()){
        if(m_image->hasOrganTypeAtPosition(i.next(), i.next(), m_organ)){
            m_score += 200;
            qDebug() << "New score: "<< m_score << endl;
        }
    }

    if(m_correct){
        emit correctChanged(m_correct);
    }
    emit answeredChanged(m_answered);
    emit scoreChanged(m_score);
    return m_correct;
}


Task *Task::createRandomTask(QObject *parent)
{
    const std::array<int, 15+1> supportsFemur = { //TODO: cleanup
        false, //doesn't exist
        true,
        true,
        true,
        false,
        true,
        true,
        false,
        false,
        true,
        true,
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

Organ::Type Task::getOrgan() const
{
    return m_organ;
}

UltraSoundImage *Task::getImage()
{
    return m_image;
}

bool Task::isCorrect() const
{
    return m_correct;
}

int Task::getScore() {
    return m_score;
}
