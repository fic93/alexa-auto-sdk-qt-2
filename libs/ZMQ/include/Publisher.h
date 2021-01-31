/** @file    Publisher.h
* @copyright Rimac Automobili license (??)
* @author    josip.vukusic
* @brief     A class that publishes message on ZMQ. It creates ZMQ socket,
*            inside given ZMQ context.
*/
#ifndef PUBLISHER_H
#define PUBLISHER_H

#include "DataTypes/ZMQMessage.h"

#include <QString>
#include <QObject>
#include <QTimer>

#include <nzmqt/nzmqt.hpp>

namespace RA::zeromq
{

class Publisher: public QObject
{
    Q_OBJECT
public:
    /**
     * @brief Publisher
     * @param ctx     ZMQ context where ZMQ socket will be created
     * @param adress  Address where all messages are published
     * @param topic   Subtopic on witch all messages are published
     */
    Publisher(nzmqt::ZMQContext *contex, const QString &adress,
              const QString &topic, QObject *parent = nullptr);

    virtual ~Publisher();

    /**
     * @brief sendMessage Publishes given message with the class topic name
     * @param message     The message that gets published
     */
    void sendMessage(ZMQMessage &message);

    /**
     * @brief sendMessage Publishes given message with the given topic
     * @param message     The message that gets published
     * @param topic       Topic of the message
     */
    void sendMessage(ZMQMessage &message, const QString &topic);

    /**
     * @brief sendMessageWithSubTopic Publishes given message with topic in
     *                                form classtopic/Subtopic
     * @param message                 The message that gets published
     * @param topic                   Subtopic of the message
     */
    void sendMessageWithSubTopic(ZMQMessage &message, const QString &topic);

private:

    void sendHeartbeat();

    const QString      m_topicName;
    nzmqt::ZMQSocket  *m_socket;
    QTimer m_heartbeatTimer;
};

}
#endif // PUBLISHER_H
/**    (c) Copyright 2018, Rimac Automobili d.o.o., Sveta Nedelja, Croatia
*                              All rights reserved
*/
