#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include <QObject>


class GameHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString question READ getQuestion NOTIFY questionChanged)
    Q_PROPERTY(QString answer READ getAnswer NOTIFY answerChanged)
    Q_PROPERTY(QString image READ getImage NOTIFY imageChanged)
    Q_PROPERTY(bool nextButtonVisible READ getNextButtonVisibility NOTIFY taskActivityChanged)
    Q_PROPERTY(bool gameFinished READ getGameFinished NOTIFY gameFinishedChanged)
    Q_PROPERTY(int timeSpent READ getTimeSpent NOTIFY timeSpentChanged)
    Q_PROPERTY(int highscore MEMBER m_high_score NOTIFY highScoreSpentChanged)
    Q_PROPERTY(bool timed MEMBER m_timed NOTIFY levelChanged)
    Q_PROPERTY(int timed_highscore MEMBER m_timed_high_score NOTIFY highScoreSpentChanged)

public:
    GameHandler(QObject *parent = nullptr);

    Q_INVOKABLE void imageClicked(int x, int y, int width, int height);


    QString getQuestion();
    void setQuestion(QString newValue);
    void setQuestion();

    QString getAnswer();
    void setAnswer(QString newValue);

    QString getImage();
    void setImage(QString newValue);

    bool getNextButtonVisibility();
    void setTaskActivity(bool b);

    int getGameFinished();
    void setGameFinished(bool b);

    int getTimeSpent();

    bool isCorrectColor(int x, int y, int width, int height);

    void setLevel(bool b);


signals:
    void questionChanged(QString newValue);
    void answerChanged(QString newValue);
    void imageChanged(QString newValue);
    void taskActivityChanged();
    void gameFinishedChanged();
    void timeSpentChanged();
    void highScoreSpentChanged(int newValue);
    void levelChanged();

public slots:


private:
    QString m_question;
    QString m_answer;
    QString m_image;
    bool m_game_finished;
    bool m_taskActive;
    bool m_timed;
    int m_task;
    int m_points;
    int m_organ;
    int m_multiplier;
    int m_tasks_finished;
    int m_high_score;
    int m_timed_high_score;
    time_t m_start_time;
    time_t m_end_time;


};

#endif // GAMEHANDLER_H
