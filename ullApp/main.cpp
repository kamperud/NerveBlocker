#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "platformdetailes.h"
#include "gamehandler.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    PlatformDetailes sys;
    GameHandler gamehandler;
    engine.rootContext()->setContextProperty("sys", &sys);
    engine.rootContext()->setContextProperty("gamehandler", &gamehandler);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
