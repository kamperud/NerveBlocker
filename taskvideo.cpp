#include "taskvideo.h"

#include <QVector>
#include <QDebug>
#include <cmath>


TaskVideo::TaskVideo(QObject *parent) :
    QObject(parent),
    m_timeSpots(QVector<int>()),
    m_score(0),
    m_answered(false)
{
   m_timeSpots.append(5000);
   m_timeSpots.append(18860);
}

QString TaskVideo::getVideoPath() const
{
    return QString("http://folk.ntnu.no/solvehel/FL_Acq04_2DFrames_RGB_v1.mp4");
}
int TaskVideo::getScore() const{
    return m_score;
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


