#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <zmq.hpp>
#include <string>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_tapToTalk_clicked()
{
    //  Prepare our context and socket
    zmq::context_t context (1);
    zmq::socket_t socket (context, ZMQ_REQ);

    std::cout << "Pinging server !!" << std::endl;
    socket.connect ("tcp://localhost:5555");

    //  Send request to the server
    zmq::message_t request (5);
    memcpy (request.data (), "HEY SERVER", 5);
    socket.send (request);

    //  Get the reply.
    zmq::message_t reply;
    socket.recv (&reply);

    std::string rpl = std::string(static_cast<char*>(reply.data()), reply.size());

    std::cout << "Reply: " << rpl << std::endl;
}
