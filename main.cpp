#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <textonly.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    // QGuiApplication app(argc, argv);
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/images/logo/logo.jpg"));
    QQmlApplicationEngine engine;

    textOnly *obj = new textOnly;
    engine.rootContext()->setContextProperty("textOnly", obj);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
