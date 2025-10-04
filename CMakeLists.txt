cmake_minimum_required(VERSION 3.10)
project(Project_one)
set(CMAKE_CXX_STANDARD 11)

# 配置选项
option(BUILD_TESTS "Build tests" ON)
option(USE_MYMATH "Use custom math functions" ON)
option(USE_IMAGE_PROC "Use image processing" ON)
option(LINK_TYPE "Use static linking for MathFunctions" ON)

# 生成 config.h
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/config.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/config.h
)

# 包含生成的 config.h 目录
include_directories(${CMAKE_CURRENT_BINARY_DIR})

# 主应用程序
add_executable(counter firstCMake/main.cpp)

# 包含目录
target_include_directories(counter PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/image_proc
    ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/math
    ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake
    ${CMAKE_CURRENT_BINARY_DIR}
)

# 构建数学库
if(LINK_TYPE)
    add_library(MathFunctions STATIC ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/math/MathFunctions.cpp)
else()
    add_library(MathFunctions SHARED ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/math/MathFunctions.cpp)
endif()
message(STATUS "LINK_TYPE is: ${LINK_TYPE}")

# 构建图像处理库
add_library(ImageProcessor STATIC ${CMAKE_CURRENT_SOURCE_DIR}/firstCMake/image_proc/ImageProcessor.cpp)

# 查找 OpenCV
find_package(OpenCV REQUIRED)

# 链接库
target_link_libraries(counter 
    PUBLIC 
    MathFunctions
    ImageProcessor 
    ${OpenCV_LIBS}
)

target_include_directories(ImageProcessor PUBLIC ${OpenCV_INCLUDE_DIRS})
target_include_directories(counter PUBLIC ${OpenCV_INCLUDE_DIRS})

# 测试配置
if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(firstCMake/tests)
    message(STATUS "Testing enabled - tests subdirectory added")
endif()