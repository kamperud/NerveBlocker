#include "taskvideo.h"
#include "constants.h"

#include <QVector>
#include <QDebug>
#include <cmath>


TaskVideo::TaskVideo(QObject *parent) :
    QObject(parent),
    m_score(0),
    m_numIntervals(0),
    m_index((rand() % MAX_VIDEOS)+1),
    m_answered(false),
    m_start(QList<int>()),
    m_end(QList<int>())
{
   if(m_index==2){
       m_start.append(0);
       m_end.append(4000);

       m_start.append(8000);
       m_end.append(11000);

       m_start.append(15000);
       m_end.append(28120);

       m_numIntervals = 3;
   }
   else {
       m_start.append(0);
       m_end.append(2000);

       m_start.append(16000);
       m_end.append(20000);

       m_numIntervals = 2;
   }
}

QString TaskVideo::getVideoPath() const
{
    return QString("http://folk.ntnu.no/solvehel/video_0%1.mp4").arg(m_index);
}
int TaskVideo::getScore() const{
    return m_score;
}
int TaskVideo::getNumIntervals() const{
    return m_numIntervals;
}

int TaskVideo::getMaxScore() const{
    //TODO, create actual max score
    return 2000;
}
QList<int> TaskVideo::getStartValues() const{
    return m_start;
}
QList<int> TaskVideo::getEndValues() const{
    return m_end;
}

int TaskVideo::answerVideoTask(int timeSpot){
    m_answered = true;

    for(int i=0; i<m_numIntervals; i++){
        if(timeSpot>=m_start[i] && timeSpot<=m_end[i]){
            m_score = getMaxScore();
            break;
        }
    }

    if(m_score>0)   {
        emit scoreChanged(m_score);
    }
    emit answeredChanged(m_answered);
    return m_score;
}


