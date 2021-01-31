/** @file    ZMQAdapter.h
* @copyright Rimac Automobili license (??)
* @author    josip.vukusic
* @brief     A adapter to ZMQ inter-process communication transport. The Adapter
*            uses publish/subscribe pattern and it consists of one
*            publisher, and list of subscribers. The Publisher sends messages
*            with topic with same base, other 'subtopics' are added
*            as sufix (ex. Base/SubTopic).
*/
#ifndef ZMQADAPTER_H
#define ZMQADAPTER_H

#include "DataTypes/ZMQMessage.h"
#include "Subscriber.h"
#include "Publisher.h"

#include <nzmqt/nzmqt.hpp>

#include <QObject>
#include <QStringList>
#include <QVariant>
#include "zmqinterface_global.h"

namespace RA::zeromq
{

class ZMQINTERFACESHARED_EXPORT ZMQAdapter: public QObject
{
    Q_OBJECT

public:
    /**
     * @brief The ZMQServer struct models ZMQ server wiith it's address and
     * list of topics.
     */
    struct ZMQServer
    {
        QString adress;
        QStringList topics;
    };

    /**
     * @brief ZMQAdapter
     * @param publishAdress Publisher's adress
     * @param publishTopic  Publisher's base topic
     * @param subServers    List of subscription servers on which adapter
     *                      subscribes to.
     */
    ZMQAdapter(const QString &publishAdress, const QString &publishTopic,
               const QList<ZMQServer> &subServers, QObject *parent = nullptr);

    /**
     * @brief ZMQAdapter
     * @param adapterConfigFilePath Path to config.ini file with publisher and
     *                              subscriber info
     */
    explicit ZMQAdapter(const QString &adapterConfigFilePath, QObject *parent = nullptr);

    virtual ~ZMQAdapter();

    /**
     * @brief sendMessage A method for sending (publishing) message on ZMQ,
     *                    The message is sent over the class publisher with
     *                    publisher default (base) topic
     * @param message
     */
    void sendMessage(ZMQMessage &message);


    /**
     * @brief sendMessage A method for sending (publishing) message on ZMQ,
     *                    the message consists of name and value.
     *                    The message is sent over the class publisher with
     *                    publisher default (base) topic
     * @param name
     * @param value
     */
    void sendMessage(const QString &name, const QVariant &value);

    /**
     * @brief sendMessage A method for sending (publishing) message on ZMQ,
     *                    the message consists of name and value.
     *                    The message is sent over the class publisher with
     *                    topic in form PublisherBaseTopic/Subtopic
     * @param name
     * @param value
     * @param subtopic
     */
    void sendMessage(const QString &name, const QVariant &value, const QString subtopic);

    /**
     * @brief sendMessage A method for sending (publishing) message on ZMQ,
     *                    The message is sent over the class publisher with
     *                    topic in form PublisherBaseTopic/Subtopic
     * @param message
     * @param subtopic
     */
    void sendMessage(ZMQMessage &message, const QString subtopic);

private slots:
    void messageReceived(QString &topic, ZMQMessage &message);


signals:
    /**
     * @brief newMessage This signal is emmited when new message from
     *                   subscribers is received.
     * @param message
     */
    void newMessage(ZMQMessage &message);

    /**
     * @brief newMessage  This signal is emmited when new message from
     *                   subscribers is received.
     * @param topic
     * @param message
     */
    void newTopicMessage(QString &topic, ZMQMessage &message);

    /**
     * @brief newMessage  This signal is emmited when new message from
     *                   subscribers is received.
     * @param name
     * @param value
     */
    void newMessageNameValue(QString name, QVariant value);

    /**
     * @brief newMessage  This signal is emmited when new message from
     *                   subscribers is received.
     * @param topic
     * @param name
     * @param value
     */
    void newTopicMessageNameValue(QString &topic, QString name, QVariant value);

    /**
     * @brief subscriberStatusChanged Signal is emmited when the Subscriber connection is established or dropped
     * @param address  Subscriber address
     * @param topic    Subscriber topic/s separated with "/"
     * @param topic    Subscriber status (connected or disconnected)
     */
    void subscriberStatusChanged(const QString &address, const QString &topic, bool isConnected);


private:
    nzmqt::ZMQContext  *m_zmqContext {nullptr};
    QList<Subscriber *> m_subscribers;
    Publisher          *m_publisher {nullptr};

};

}
#endif // ZMQADAPTER_H
/**    (c) Copyright 2018, Rimac Automobili d.o.o., Sveta Nedelja, Croatia
*                              All rights reserved
*/
