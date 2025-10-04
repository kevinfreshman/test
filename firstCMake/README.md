# CMake 作业

本项目是一个 CMake 构建系统的进阶练习，主要展示了如何使用 CMake 管理稍微具有复杂依赖关系的 C++ 项目。

另外，本README.md 只是说明了总体要求，并且该项目有强行缝合的嫌疑。

本项目头文件.h、cpp文件已经给出，可能会有微小错误，需要读者自行斟酌修改，并没有非黑即白的答案。

## 项目结构

下面的项目结构删去了CMakeLists.txt 文件，实际项目中需要包含这些文件。

```bash
cmakeHW/
├── config.h             # 配置头文件
├── main.cpp                 # 主程序源文件
├── math/                   # 数学库模块
│   ├── MathFunctions.h     # 数学库头文件
│   └── MathFunctions.cpp    # 数学库源文件
└── image_proc/            # 图像处理模块
    ├── ImageProcessor.h    # 图像处理头文件
    └── ImageProcessor.cpp  # 图像处理源文件
```

## 作业要求

请实现以下 CMake 特性：

   - 在MathFunctions 模块中实现支持静态库和动态库的构建，即在cmake .. 命令中可以自行指定将MathFunctions模块构建成静态库还是动态库。
   - 外部依赖管理（如 OpenCV库），这部分在ImageProcessor模块中,如果必要的话，您需要自行安装OpenCV库。
   - 针对自定义数学库的power方法，在cmake中实现test功能，即可以在cmake .. 命令中添加-DBUILD_TESTS=ON 选项来构建测试用例。
   - CMAKE_BUILD_TYPE 自行指定构建类型release/debug

其余功能例如opencv的测试图片、方法等等，自行修改或者添加，让其更为美观、优雅。

## 构建选项

- USE_MYMATH: 是否使用自定义数学库（默认：ON）
- USE_IMAGE_PROC: 是否启用图像处理功能（默认：ON）
- BUILD_SHARED_LIBS: 是否构建动态库（默认：ON）
- BUILD_STATIC_LIBS: 是否构建静态库（默认：ON）
- BUILD_TESTS: 是否构建测试用例（默认：ON）

## 使用

1. 数学计算：
```bash
./CMakeHW power 2 10
```

2. 图像处理：
```bash
./CMakeHW image test.jpg
```

# 作业提交

- 请勿提交完整的源码
- 请给出该项目运行自定义数学库以及图像处理模块的截图
- 如果有想法改进本作业，欢迎提交
- 请提交CMakeLists.txt们，其他代码自便。
