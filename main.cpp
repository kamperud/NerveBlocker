#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "gamehandler.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GameHandler gamehandler;
    engine.rootContext()->setContextProperty("gamehandler", &gamehandler);
    engine.load(QUrl(QStringLiteral("qrc:/GameMain.qml")));

    return app.exec();
}
