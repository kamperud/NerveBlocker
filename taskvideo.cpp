#include "taskvideo.h"

#include <QVector>
#include <QDebug>


TaskVideo::TaskVideo(QObject *parent) :
    QObject(parent),
    m_timeSpots(QVector<int>(5000, 18860)),
    m_score(0),
    m_answered(false)
{}

QString TaskVideo::getVideoPath() const
{
    return QString("http://folk.ntnu.no/solvehel/FL_Acq04_2DFrames_RGB_v1.mp4");
}
int TaskVideo::getScore() const{
    return m_score;
}

int TaskVideo::answerVideoTask(int timeSpot){
    qDebug()<< "I got here \n"<<endl;
    // find closest timespot, calculate score, return timespot
    return 18860;
}


