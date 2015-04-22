#include "taskannotation.h"
#include "constants.h"

#include <QList>
#include <QDebug>

TaskAnnotation::TaskAnnotation(QObject *parent) :
    QObject(parent),
    yValues((QList<int>())),
    xValues((QList<int>())),
    m_score(0),
    m_answered(false),
    m_index(DRAG_PICS[(rand() % MAX_DRAG_IMAGES)])
{
    switch (m_index){
    case 1:
        xValues<<7<<181<<286<<369<<593;
        yValues<<142<<162<<190<<258<<290;
        break;
    case 2:
        xValues<<3<<188<<288<<368<<641;
        yValues<<133<<150<<172<<178<<309;
        break;
    case 3:
        xValues<<18<<338<<442<<519<<640;
        yValues<<124<<191<<209<<271<<283;
        break;
    case 6:
        xValues<<8<<223<<354<<419<<560;
        yValues<<71<<92<<117<<203<<224;
        break;
    case 8:
        xValues<<0<<100<<304<<421<<498;
        yValues<<184<<183<<190<<269<<291;
        break;
    case 9:
        xValues<<1<<362<<485<<556<<640;
        yValues<<71<<81<<106<<162<<184;
        break;
    case 10:
        xValues<<89<<272<<385<<435<<612;
        yValues<<77<<105<<125<<166<<227;
        break;
    default:
        xValues<<0<<0<<0<<0<<0;
        yValues<<142<<162<<190<<258<<290;
    }
}

int TaskAnnotation::getScore() const{
    return m_score;
}
int TaskAnnotation::getMaxScore() const{
    //TODO, create actual max score
    return 2000;
}

QList<int> TaskAnnotation::getXValues() const{
    return xValues;
}

QString TaskAnnotation::getImagePath() const{
    return QString("gameImages/%1.png").arg(m_index);
}
QString TaskAnnotation::getMappedImagePath() const{
    return QString("gameImages/%1_map.png").arg(m_index);
}

void TaskAnnotation::answerAnnotationTask(QList<int> answers){

    int distance = 0;
    for(int i=0; i<5; i++){
        int temp = abs(answers[i]-yValues[i]);
        distance += temp;
    }
    distance = 1000 - distance*5;
    if(distance > m_score) {
        m_score = distance*2;
        emit scoreChanged(m_score);
    }
    emit answeredChanged(false);
}



