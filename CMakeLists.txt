cmake_minimum_required(VERSION 3.11)
project(optimizer VERSION 0.1)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

set(SOURCES
    main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})