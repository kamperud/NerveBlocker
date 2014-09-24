#include "platformdetailes.h"

PlatformDetailes::PlatformDetailes(QObject *parent) :
    QObject(parent){}

bool PlatformDetailes::isIos()
{
#ifdef Q_OS_IOS
   return true;
#endif
   return false;
}
