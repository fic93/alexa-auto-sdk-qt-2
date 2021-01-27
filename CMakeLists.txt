cmake_minimum_required(VERSION 3.5.1)

project(alexa_frontend)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(alexa_frontend
    zmq
)