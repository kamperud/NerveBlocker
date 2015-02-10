#include "gamehandler.h"
#include "constants.h"
#include "game.h"
#include "mode.h"


#include <QImage>
#include <QDebug>
#include <QTimer>
#include <QFileInfo>
#include <cstdlib>
#include <time.h>

GameHandler::GameHandler(QObject *parent) :
    QObject(parent),
    m_game(nullptr),
    m_high_score(0),
    m_timed_high_score(0){
    srand (time(NULL));
}

void GameHandler::newGame(int mode)
{
    if(m_game!=nullptr) m_game->deleteLater();

    m_game = new Game(Mode::Type(mode), this);
    connect(m_game, &Game::finishedChanged, this, &GameHandler::updateHighScore);
    emit gameChanged(m_game);

}


Game *GameHandler::getGame()
{
    return m_game;
}

int GameHandler::getHighScore()
{
    if(this->getGame()->getMode()==Mode::TIMED)
        return m_timed_high_score;
    return m_high_score;
}

void GameHandler::updateHighScore()
{
    if(m_game->getMode()==Mode::NORMAL){
        int newPoints = m_game->getPoints();
        if(newPoints>m_high_score){
            m_high_score = newPoints;
            emit highScoreChanged(m_high_score);
        }
    }
    else if(m_game->getMode()==Mode::TIMED){
        int newPoints = m_game->getPoints();
        if(newPoints>m_timed_high_score) {
            m_timed_high_score = newPoints;
            emit highScoreChanged(m_timed_high_score);
        }
    }


}


