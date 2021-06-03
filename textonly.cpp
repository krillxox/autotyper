#include "textonly.h"
#include <QString>
#include <QProcess>
#include <QThread>
textOnly::textOnly(QObject *parent) : QObject(parent)
{
    b = new QLine();
}

void textOnly::startTyping(const QString &txt)
{
    // QStringList test = {"sleep 3 ", "type ", "\"check\n\""};
    // QStringList test = {"sleep 3 ", "type "};
    // QStringList mte = {"3"};
    QProcess nani;
    QProcess::execute("xdotool key alt+Tab");
    for(auto i : txt){
        QString foo = "xdotool type " + QString(i);
        if (i == "\xa")
        {
            // QProcess::execute("xdotool key Return");
                nani.start("xdotool key Return");
                while (!nani.waitForFinished())
                {
                    continue;
                }
                continue;
        }
        
        if(i == " ")
        {
            // QProcess::execute("xdotool key space");
            nani.start("xdotool key space");
            while (!nani.waitForFinished())
            {
                continue;
            }
            continue;
        }

        // QProcess::execute(foo);

        nani.start(foo);
        while(!nani.waitForFinished()){
            continue;
        }
        // qDebug() << foo;
    }
   
    // QProcess::execute(foo);
   
}

QString textOnly::openDialog(){
    QString filter = "Image files (*png *.jpg *.bmp)";
    QString op = "";
    file = QFileDialog::getOpenFileName(Q_NULLPTR, "Select Image", QDir::homePath(), filter);
    qDebug() << "result()";
    // QFile fileN(file);
    // if (!fileN.open(QFile::ReadOnly))
    // {
    //     return op;
    // }
    
    QProcess nani;
    qDebug() << file.isEmpty();
    if (!file.isEmpty())
    {
        QString test = "python3 ../undefined.py " + file;
        // QProcess::execute(test);
        // op = QProcess::readAllStandardOutput();
        qDebug() << test;
        nani.start(test);
        nani.waitForStarted();
        // op = nani.readAllStandardOutput();
        // nani.waitForFinished();
        qDebug() << nani.state();
        while (nani.waitForFinished())
        {
            op += nani.readAllStandardOutput();
            // qDebug() << nani.state();
        }
    }
    // nani.waitForFinished();
    qDebug() << "exit";
    return op;
}