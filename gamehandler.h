#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include <QObject>

#define MAX_IMAGES 4

class GameHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString question READ getQuestion NOTIFY questionChanged)
    Q_PROPERTY(QString answer READ getAnswer NOTIFY answerChanged)
    Q_PROPERTY(QString image READ getImage NOTIFY imageChanged)
    Q_PROPERTY(bool nextButtonVisible READ getNextButtonVisibility NOTIFY taskActivityChanged)
    Q_PROPERTY(int multiplier READ getMultipler NOTIFY multiplierChanged)
    Q_PROPERTY(int points READ getPoints NOTIFY pointsChanged)

    Q_INVOKABLE void newTask();
    Q_INVOKABLE void imageClicked(int x, int y, int width, int height);


public:
    GameHandler(QObject *parent = 0);

    QString getQuestion();
    void setQuestion(QString newValue);

    QString getAnswer();
    void setAnswer(QString newValue);

    QString getImage();
    void setImage(QString newValue);

    bool getNextButtonVisibility();
    void setTaskActivity(bool b);

    int getMultipler();
    void setMultiplier(int newValue);

    int getPoints();
    void setPoints(int newValue);


signals:
    void questionChanged(QString newValue);
    void answerChanged(QString newValue);
    void imageChanged(QString newValue);
    void taskActivityChanged();
    void multiplierChanged(int newValue);
    void pointsChanged(int newValue);

public slots:


private:
    int m_task;
    QString m_question;
    QString m_answer;
    QString m_image;
    bool m_taskActive;
    int m_multiplier;
    int m_tasks_finished;
    int m_points;

};

#endif // GAMEHANDLER_H
