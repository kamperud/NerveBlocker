#include "gamehandler.h"
#include "constants.h"
#include "game.h"

#include <QImage>
#include <QDebug>
#include <QFileInfo>
#include <cstdlib>
#include <time.h>

GameHandler::GameHandler(QObject *parent) :
    QObject(parent){
    srand (time(NULL));
//    m_high_score = 0;
//    m_timed_high_score = 0;
}

void GameHandler::newGame()
{
    m_game = new Game(this);
    emit gameChanged(m_game);
}

Game *GameHandler::getGame()
{
    return m_game;
}

//void GameHandler::newTask(){
//    if(!m_taskActive) {
//        m_task = (rand() % MAX_IMAGES)+1;
//        m_organ = rand() % MAX_QUESTIONS;
//        setQuestion();
//        setAnswer("white");
//        setImage(QString("/gameImages/%1a.png").arg(m_task));
//        setTaskActivity(true);
//    }
//}

//void GameHandler::imageClicked(int x, int y, int width, int height){
//    if(m_taskActive) {
//        setTaskActivity(false);
//        setImage(QString("/gameImages/%1.png").arg(m_task));
//        m_tasks_finished++;

//        if( isCorrectColor(x, y, width, height)){
//            setAnswer("#89e894"); //light green
//            setQuestion("CORRECT");
////            setPoints(getPoints()+50*getMultiplier());
////            setMultiplier(getMultiplier()+1);
//        }
//        else {
//            setAnswer("red");
//            setQuestion("WRONG");
////            setMultiplier(1);
//        }

//        if(m_tasks_finished>=MAX_TASKS_PER_GAME){
//            setGameFinished(true);
//            time(&m_end_time);    //set current time
//            emit timeSpentChanged();
//            if(!m_timed && m_high_score < m_points) {
//                m_high_score = m_points;
//                emit highScoreSpentChanged(m_high_score);
//            }
//            else if (m_timed && m_timed_high_score < m_points - getTimeSpent()*10) {
//                m_timed_high_score = m_points - getTimeSpent()*10;
//                emit highScoreSpentChanged(m_timed_high_score);
//            }

//        }
//    }
//}

//bool GameHandler::isCorrectColor(int x, int y, int width, int height){
//    QImage *img = new QImage(QString(":/gameImages/%1_map.png").arg(m_task), "PNG");
//    int newX = img->width()*x/width;
//    int newY = img->height()*y/height;

//    switch (m_organ) {
//        case 0:
//            return img->pixel(newX,newY) == qRgb(255,255,0);    //yellow
//        case 1:
//            return img->pixel(newX,newY) == qRgb(255,0,0);      //red
//        case 2:
//            return img->pixel(newX,newY) == qRgb(255,0,255);    //pink-purple
//        default:
//            return false;
//    }
//}

//int GameHandler::getTimeSpent() {
//    int temp = difftime(m_end_time, m_start_time);
//    return temp;
//}

//QString GameHandler::getQuestion(){
//    return m_question;
//}
//void GameHandler::setQuestion(){
//    switch (m_organ) {
//        case 0:
//            m_question = "FEMORAL NERVE";
//            break;
//        case 1:
//            m_question = "FEMORAL ARTERY";
//            break;
//        case 2:
//            m_question = "FASCIA ILIACA";
//            break;
//        default:
//            break;
//    }
//    emit questionChanged(m_question);
//}

//void GameHandler::setQuestion(QString newValue){
//    m_question = newValue;
//    emit questionChanged(m_question);
//}

//QString GameHandler::getAnswer(){
//    return m_answer;
//}
//void GameHandler::setAnswer(QString newValue){
//    m_answer = newValue;
//    emit answerChanged(newValue);
//}
//QString GameHandler::getImage(){
//    return m_image;
//}
//void GameHandler::setImage(QString newValue){
//    m_image = newValue;
//    emit imageChanged(newValue);
//}
//bool GameHandler::getNextButtonVisibility(){
//    return !m_taskActive;
//}
//void GameHandler::setTaskActivity(bool b){
//    m_taskActive = b;
//    emit taskActivityChanged();
//}
//int GameHandler::getGameFinished(){
//    return m_game_finished;
//}
//void GameHandler::setGameFinished(bool b){
//    m_game_finished = b;
//    emit gameFinishedChanged();
//}
//void GameHandler::setLevel(bool b){
//    m_timed = b;
//    emit levelChanged();
//}

