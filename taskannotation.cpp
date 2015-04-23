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
        xValues<<0<<207<<310<<438<<608;
        yValues<<158<<163<<159<<127<<171;
        break;
    case 9:
        xValues<<121<<319<<417<<511<<600;
        yValues<<53<<71<<72<<86<<77;
        break;
    case 10:
        xValues<<10<<323<<385<<514<<616;
        yValues<<55<<88<<93<<75<<95;
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
QString TaskAnnotation::getQuestionText() const{
    if(m_index<8)   return QString("facia iliaca");
    else            return QString("facia lata");
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



