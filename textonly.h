#ifndef TEXTONLY_H
#define TEXTONLY_H

#include <QObject>
#include <QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFileDialog>
#include <QFile>
class textOnly : public QObject
{
    Q_OBJECT
public:
    explicit textOnly(QObject *parent = nullptr);
    QLine *b;
    QString file;
public slots:
    void startTyping(const QString &text);
    QString openDialog();
};

#endif // TEXTONLY_H
