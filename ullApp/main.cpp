#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "platformdetailes.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    PlatformDetailes sys;
    engine.rootContext()->setContextProperty("sys", &sys);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
