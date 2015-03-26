#include "taskannotation.h"

#include <QList>
#include <QDebug>

TaskAnnotation::TaskAnnotation(QObject *parent) :
    QObject(parent),
    yValues((QList<int>())),
    xValues((QList<int>())),
    m_score(0),
    m_answered(false)

{
    yValues<<143<<160<<187<<266<<293;
    xValues<<7<<181<<286<<369<<593;
}

int TaskAnnotation::getScore() const{
    return m_score;
}
QList<int> TaskAnnotation::getXValues() const{
    return xValues;
}

QString TaskAnnotation::getImagePath() const{
    return QString("gameImages/1.png");
}

void TaskAnnotation::answerAnnotationTask(QList<int> answers){

    int distance = 0;
    for(int i=0; i<5; i++){
        distance += abs(answers[i]-yValues[i]);
    }
    distance = 1000 - distance*5;
    if(distance > m_score) {
        m_score = distance*2;
        emit scoreChanged(m_score);
    }

    emit answeredChanged(false);
}



