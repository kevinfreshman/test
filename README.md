# CMake 作业firstCMake （10分）
这是来自冯梓滔的作业

我知道为什么提示词语中提到*该项目有强行缝合的嫌疑*了，因为他的制作人故意把两个毫无关系的代码拼凑在一起。

常见的CMake Debug技巧包括：

1. 使用message命令打印变量值或执行流程。
    
2. 使用--debug-output、--trace、--trace-expand等选项运行CMake，以获取详细的输出信息。
    
3. 检查CMakeCache.txt和CMakeFiles目录下的文件。
    
4. 使用CMake GUI工具查看和修改变量。
### 1. **详细输出模式**
```
```#启用详细输出
cmake .. --debug-output
cmake .. --trace
cmake .. --trace-expand

或者
make VERBOSE=1

### 2. **message() 调试输出**
```
```message(STATUS "This is a status message")
message(WARNING "This is a warning message")
message(AUTHOR_WARNING "This is an author warning")
message(SEND_ERROR "This is a send error")
message(FATAL_ERROR "This is a fatal error")

# 调试变量值
message(STATUS "OpenCV_LIBS = ${OpenCV_LIBS}")
message(STATUS "CMAKE_BUILD_TYPE = ${CMAKE_BUILD_TYPE}")

