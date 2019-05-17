#include "mynetwork.h"

MyNetwork::MyNetwork(QObject *parent) : QObject(parent)
{
    m_udpSocket = new QUdpSocket(this);
    m_udpSocket->bind(5551, QUdpSocket::ShareAddress);

//    connect(m_udpSocket, SIGNAL(readyRead()),
//            this, SLOT(readyReadUDP()));

}

void MyNetwork::sendRGB(QString color)
{
    qDebug() << color.replace("#","") ;
    QByteArray datagram = "rgb;set;"+color.toUtf8() ;
    m_udpSocket->writeDatagram(datagram.data(), datagram.size(),
                               //QHostAddress::Broadcast, udpPort);
                              QHostAddress("255.255.255.255"), 5551);
}
