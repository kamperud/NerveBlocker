#include "game.h"
#include "task.h"

Game::Game(QObject *parent):
    QObject(parent),
    m_currentTask(nullptr),
    m_points(0),
    m_multiplier(1),
    m_tasksAnswered(0)
{
    newTask();
}

Task *Game::getCurrentTask()
{
    return m_currentTask;
}

bool Game::isFinished() const
{
    return m_tasksAnswered >= 3;
}

//void GameHandler::newGame() {
//    m_game_finished = false;
//    m_tasks_finished = 0;
//    time(&m_start_time);    //set current time
//}

void Game::newTask()
{
    if(m_currentTask!=nullptr){
        delete m_currentTask;
        m_currentTask = nullptr;
    }

    m_currentTask = Task::createRandomTask(this);
    m_currentTask->connect(m_currentTask, &Task::answeredChanged,
                           this, &Game::onTaskAnswered);

    emit currentTaskChanged(m_currentTask);
}

void Game::onTaskAnswered()
{
    bool oldFinished = isFinished();
    m_tasksAnswered++;
    emit tasksAnsweredChanged(m_tasksAnswered);

    if(m_currentTask->isCorrect()){
        int receivedPoints = 50 * getMultiplier();
        setPoints(getPoints() + receivedPoints);
        setMultiplier(getMultiplier()+1);
    } else {
        setMultiplier(1);
    }

    bool newFinished = isFinished();
    if(oldFinished != newFinished)emit finishedChanged(newFinished);
}

int Game::getMultiplier() const {
    return m_multiplier;
}

void Game::setMultiplier(int newValue){
    m_multiplier = newValue;
    emit multiplierChanged(newValue);
}

int Game::getPoints() const {
    return m_points;
}

void Game::setPoints(int newValue){
    m_points = newValue;
    emit pointsChanged(newValue);
}
