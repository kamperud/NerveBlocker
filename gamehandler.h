#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include "game.h"
#include "mode.h"

#include <QObject>

class GameHandler : public QObject
{
    Q_OBJECT

//    Q_PROPERTY(QString question READ getQuestion NOTIFY questionChanged)
//    Q_PROPERTY(QString answer READ getAnswer NOTIFY answerChanged)
//    Q_PROPERTY(QString image READ getImage NOTIFY imageChanged)
//    Q_PROPERTY(bool nextButtonVisible READ getNextButtonVisibility NOTIFY taskActivityChanged)
//    Q_PROPERTY(bool gameFinished READ getGameFinished NOTIFY gameFinishedChanged)
//    Q_PROPERTY(int timeSpent READ getTimeSpent NOTIFY timeSpentChanged)
    Q_PROPERTY(int highscore READ getHighScore NOTIFY highScoreSpentChanged)
//    Q_PROPERTY(bool timed MEMBER m_timed NOTIFY levelChanged)
//    Q_PROPERTY(int timed_highscore MEMBER m_timed_high_score NOTIFY highScoreSpentChanged)
    Q_PROPERTY(QObject *game READ getGame NOTIFY gameChanged)

public:
    GameHandler(QObject *parent = nullptr);
    Q_INVOKABLE void newGame(int);
    Game* getGame();
    int getHighScore();

//    QString getQuestion();
//    void setQuestion(QString newValue);
//    void setQuestion();

//    QString getAnswer();
//    void setAnswer(QString newValue);

//    QString getImage();
//    void setImage(QString newValue);

//    bool getNextButtonVisibility();
//    void setTaskActivity(bool b);

//    int getGameFinished();
//    void setGameFinished(bool b);

//    int getTimeSpent();

//    bool isCorrectColor(int x, int y, int width, int height);

//    void setLevel(bool b);


signals:
    void gameChanged(Game* newGame);
//    void questionChanged(QString newValue);
//    void answerChanged(QString newValue);
//    void imageChanged(QString newValue);
//    void taskActivityChanged();
//    void gameFinishedChanged();
//    void timeSpentChanged();
    void highScoreSpentChanged(int newValue);
//    void levelChanged();

public slots:


private:
    Game* m_game;
    int m_high_score;
    int m_timed_high_score;


};

#endif // GAMEHANDLER_H
