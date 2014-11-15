#include "gamehandler.h"
#include "game.h"
#include "task.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    GameHandler gamehandler;
    engine.rootContext()->setContextProperty("gamehandler", &gamehandler);
    qmlRegisterUncreatableType<Organ>("UllApp", 1, 0, "Organ", "Organ is uncreatable");
    engine.load(QUrl(QStringLiteral("qrc:/GameMain.qml")));

    return app.exec();
}
