/** @file    ZMQMessage.h
* @copyright Rimac Automobili license (??)
* @author    josip.vukusic
* @brief     Class that models message that gets transmitted throughout ZMQ.
*            Message consist of variable name and value. QVariant is used
*            for value type so it can be easy serialized/deserialized. In this
*            file are also implementations of QDataStream operator methods
*            (<<,>>) for ZMQMessage parameter. These methods are used for
*            easy QByteArray serialization/deserialization.
*/
#ifndef ZMQMESSAGE_H
#define ZMQMESSAGE_H

#include <QString>
#include <QDataStream>
#include <QVariant>
#include <QMetaType>

namespace RA::zeromq
{

class ZMQMessage
{
public:
    ZMQMessage();
    ZMQMessage(const QString &name, const QVariant &value);

    QString name() const;
    void setName(QString &name);

    QVariant value() const;
    void setValue(QVariant value);

private:
    QString  m_name;
    QVariant m_value;
};

inline QDataStream &operator <<(QDataStream &out, const ZMQMessage &obj)
{
    out << obj.value();
    out << obj.name();

    return out;
}

inline QDataStream &operator >>(QDataStream &in, ZMQMessage &obj)
{
    QString name;
    QVariant value;

    in >> value >> name;

    obj.setName(name);
    obj.setValue(value);

    return in;
}

}

#endif // ZMQMESSAGE_H
/**    (c) Copyright 2018, Rimac Automobili d.o.o., Sveta Nedelja, Croatia
*                              All rights reserved
*/
