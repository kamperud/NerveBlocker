#ifndef GAMEHANDLER_H
#define GAMEHANDLER_H

#include <QObject>

#define MAX_IMAGES 2

class GameHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString question READ getQuestion WRITE setQuestion NOTIFY questionChanged)
    Q_PROPERTY(QString answer READ getAnswer WRITE setAnswer NOTIFY answerChanged)
    Q_PROPERTY(QString image READ getImage WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(bool nextButtonVisible READ getNextButtonVisibility NOTIFY taskActivityChanged)



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

    Q_INVOKABLE void newTask();
    Q_INVOKABLE void imageClicked(int x, int y, int width, int height);


signals:
    void questionChanged(QString newValue);
    void answerChanged(QString newValue);
    void imageChanged(QString newValue);
    void taskActivityChanged();

public slots:


private:
    int m_task;
    QString m_question;
    QString m_answer;
    QString m_image;
    bool m_taskActive;

};

#endif // GAMEHANDLER_H
