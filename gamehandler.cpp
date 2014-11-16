#include "gamehandler.h"
#include "constants.h"
#include "game.h"
#include "mode.h"


#include <QImage>
#include <QDebug>
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

