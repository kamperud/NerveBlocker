#ifndef TASKANNOTATION_H
#define TASKANNOTATION_H

#include <QObject>
#include <QList>

class TaskAnnotation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ getImagePath CONSTANT)
    Q_PROPERTY(QString mappedImagePath READ getMappedImagePath CONSTANT)
    Q_PROPERTY(QList<int> xValues READ getXValues CONSTANT)
    Q_PROPERTY(int score READ getScore NOTIFY scoreChanged)
    Q_PROPERTY(bool answered MEMBER m_answered NOTIFY answeredChanged)
public:
    explicit TaskAnnotation(QObject *parent = 0);
    QString getImagePath() const;
    QString getMappedImagePath() const;
    int getScore() const;
    int getMaxScore() const;
    QList<int> getXValues() const;

signals:
    void scoreChanged(int newValue);
    void answeredChanged(bool newValue);

public slots:
    void answerAnnotationTask(QList<int> answers);

private:
    QList<int> yValues;
    QList<int> xValues;
    int m_score;
    bool m_answered;
    int m_index;

};

#endif // TASKANNOTATION_H
