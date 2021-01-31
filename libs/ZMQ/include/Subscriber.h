/** @file    Subscriber.h
* @copyright Rimac Automobili license (??)
* @author    josip.vukusic
* @brief     A class that reads message from ZMQ. It creates ZMQ socket,
*            inside given ZMQ context.
*/
#ifndef SUBSCRIBER_H
#define SUBSCRIBER_H

#include "DataTypes/ZMQMessage.h"

#include <QString>
#include <QObject>
#include <QStringList>
#include <QTimer>

#include <nzmqt/nzmqt.hpp>

namespace RA::zeromq
{

class Subscriber: public QObject
{
    Q_OBJECT
public:
    /**
     * @brief Subscriber
     * @param context   ZMQ context where ZMQ socket will be created.
     * @param adress    The Address from which all messages are read.
     * @param topics    List of topic that this class subscribes to.
     *                  Subscription is made on given address.
     */
    Subscriber(nzmqt::ZMQContext *context, const QString &adress,
               const QStringList &topics, QObject *parent = nullptr);

    virtual ~Subscriber();

    /**
     * @brief subscribeToTopic Subscribes on given topic, subscription is done
     *                         on class predefined adress
     * @param topicName
     */
    void subscribeToTopic(const QString &topicName);

signals:
    /**
     * @brief newMessage This signal is emmited when new message from predefined
     *                   topics is received.
     * @param message
     */
    void newMessage(QString &topic, ZMQMessage &message);

    /**
     * @brief statusChanged Signal is emmited when the connection is established or dropped
     */
    void statusChanged(const QString &address, const QString &topic, bool isConnected);

private:
    void establishConnection();
    void processMessage(const QList<QByteArray> &message);

    nzmqt::ZMQSocket        *m_socket;
    nzmqt::ZMQContext       *m_context;
    const QString            m_address;
    QStringList              m_topics;
    qint64                   m_lastHeartbeatTime;
    QTimer m_timer;
    bool                     m_isConnected;
};

}

#endif // SUBSCRIBER_H
/**    (c) Copyright 2018, Rimac Automobili d.o.o., Sveta Nedelja, Croatia
*                              All rights reserved
*/
