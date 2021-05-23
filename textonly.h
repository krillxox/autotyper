#ifndef TEXTONLY_H
#define TEXTONLY_H

#include <QObject>
#include <QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

class textOnly : public QObject
{
    Q_OBJECT
public:
    explicit textOnly(QObject *parent = nullptr);

signals:
    void startTyping(const QString &text);
};

#endif // TEXTONLY_H
