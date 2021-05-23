#include "textonly.h"
textOnly::textOnly(QObject *parent) : QObject(parent)
{

}

void textOnly::startTyping(const QString &txt)
{
    for(auto i : txt)   qDebug() << i;
}
