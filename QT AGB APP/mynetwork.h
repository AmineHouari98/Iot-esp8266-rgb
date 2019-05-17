#ifndef MYNETWORK_H
#define MYNETWORK_H

#include <QObject>
#include <QUdpSocket>
#include <QDebug>

class MyNetwork : public QObject
{
    Q_OBJECT
public:
    explicit MyNetwork(QObject *parent = nullptr);

signals:

public slots:
    void sendRGB(QString color) ;
private:
    QUdpSocket *m_udpSocket = nullptr;
};

#endif // MYNETWORK_H
