#include "taskannotation.h"

TaskAnnotation::TaskAnnotation(QObject *parent) :
    QObject(parent),
    m_score(0),
    m_answered(false),
    yValues(new QList<int>(143,160,187,266,293)),
    xValues(new QList<int>(7,181,286,369,593))
{

}



