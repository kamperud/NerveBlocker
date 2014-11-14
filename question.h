#ifndef QUESTION_H
#define QUESTION_H

#include <QObject>

class Question : public QObject
{
    Q_OBJECT
public:
    explicit Question(QObject *parent = 0);

signals:

public slots:

private:
    QString question_text_upper;
    QString question_text_main;
    QString helper_text;
};

#endif // QUESTION_H
