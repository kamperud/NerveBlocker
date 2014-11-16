#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include "game.h"
#include "mode.h"

#include <QObject>

class GameHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int highscore READ getHighScore NOTIFY highScoreChanged)
    Q_PROPERTY(QObject *game READ getGame NOTIFY gameChanged)

public:
    GameHandler(QObject *parent = nullptr);
    Q_INVOKABLE void newGame(int);
    Game* getGame();
    int getHighScore();

signals:
    void gameChanged(Game* newGame);
    void highScoreChanged(int newValue);

public slots:
    void updateHighScore();

private:
    Game* m_game;
    int m_high_score;
    int m_timed_high_score;


};

#endif // GAMEHANDLER_H
