add_executable(calculator_test
    test_calculator.cpp
)

# 包含相同的头文件路径
target_include_directories(calculator_test PUBLIC
    ${CMAKE_SOURCE_DIR}/firstCMake/image_proc
    ${CMAKE_SOURCE_DIR}/firstCMake/math
    ${CMAKE_SOURCE_DIR}/firstCMake
    ${CMAKE_BINARY_DIR}
)

# 链接相同的库
target_link_libraries(calculator_test
    MathFunctions
    ImageProcessor
    ${OpenCV_LIBS}
)

# 添加测试用例 - 使用正确的可执行文件路径
add_test(NAME TestPower_Basic_2_3 
         COMMAND ${CMAKE_BINARY_DIR}/firstCMake/tests/calculator_test "2" "3")
add_test(NAME TestPower_Zero_Exponent 
         COMMAND ${CMAKE_BINARY_DIR}/firstCMake/tests/calculator_test "5" "0")
add_test(NAME TestPower_Negative_Base 
         COMMAND ${CMAKE_BINARY_DIR}/firstCMake/tests/calculator_test "-2" "3")
add_test(NAME TestPower_Fractional_Base 
         COMMAND ${CMAKE_BINARY_DIR}/firstCMake/tests/calculator_test "2.5" "2")

message(STATUS "Test executable 'calculator_test' configured for ${CMAKE_BUILD_TYPE} build")