#include "game.h"
#include "task.h"

Game::Game(QObject *parent):
    QObject(parent),
    m_currentTask(nullptr),
    m_points(0),
    m_multiplier(1)
{
    newTask();
}

Task *Game::getCurrentTask()
{
    return m_currentTask;
}

//void GameHandler::newGame() {
//    m_game_finished = false;
//    m_tasks_finished = 0;
//    time(&m_start_time);    //set current time
//}

void Game::newTask()
{
    if(m_currentTask==nullptr)delete m_currentTask;
    m_currentTask = Task::createRandomTask(this);
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
