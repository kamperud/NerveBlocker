#include "taskvideo.h"

#include <QVector>
#include <QDebug>
#include <cmath>


TaskVideo::TaskVideo(QObject *parent) :
    QObject(parent),
    m_timeSpots(QVector<int>()),
    m_score(0),
    m_answered(false),
    m_start(QList<int>()),
    m_end(QList<int>())
{
   m_timeSpots.append(2000);
   m_timeSpots.append(10000);
   m_timeSpots.append(15000);
   m_timeSpots.append(17000);
   m_timeSpots.append(20000);
   m_timeSpots.append(23000);
   m_timeSpots.append(25000);

   m_start.append(0);
   m_end.append(5000);

}

QString TaskVideo::getVideoPath() const
{
    return QString("http://folk.ntnu.no/solvehel/video_03.mp4");
}
int TaskVideo::getScore() const{
    return m_score;
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
    int index = 0;
    int closestTimeDiff = INT_MAX;

    for (int i=0; i<m_timeSpots.size(); i++){
        int timeDiff = abs(m_timeSpots.at(i) - timeSpot);

        if(timeDiff < closestTimeDiff){
            index = i;
            closestTimeDiff = timeDiff;
            timeDiff = 2000 - timeDiff;

            if (timeDiff > m_score){
                m_score = timeDiff;
            }
        }
    }

    if(m_score>0)   {
        emit scoreChanged(m_score);
    }
    emit answeredChanged(m_answered);

    return m_timeSpots.at(index);
}


