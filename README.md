# CMake 作业firstCMake （10分）

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

请实现以下 CMake 特性（对于CMake而言只是几句话）：

   - 在MathFunctions 模块中实现支持静态库和动态库的构建，即在cmake .. 命令中可以自行指定将MathFunctions模块构建成静态库还是动态库。2分
   - 外部依赖管理（如 OpenCV库），这部分在ImageProcessor模块中,如果必要的话，您需要自行安装OpenCV库。3分
   - 针对自定义数学库的power方法，在cmake中实现test功能，即可以在cmake .. 命令中添加-DBUILD_TESTS=ON 选项来构建测试用例。2分
   - CMAKE_BUILD_TYPE 自行指定构建类型release/debug 1分
   - 进行CMake Debug，在提交的README.md中简要写明步骤，并附上图片 （如果是gdb等调试工具只能给1分，本质上是需要熟悉一下cmake debug） 2分 

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

## 作业提交要求

- 请勿提交完整的源码。提交时请勿提交build、bin文件夹。
- 请给出该项目运行自定义数学库以及图像处理模块的截图。
- 如果有想法改进本作业，欢迎提交。
- 请提交CMakeLists.txt们，其他代码自便。


# 第二次作业SecondCMake (10分)

## 作业内容

> 声明：练习来自于交大课程“计算机图形学”中的实验部分。

内容为[图形学实验文档（基础部分）.pdf](图形学实验文档（基础部分）.pdf)中的前置实验lab1.0，需要的文件已经提供在本仓库中，请认真查看pdf。


## 关于作业提交

1. 如果想要消除浏览器安全提示，需要安装ssl根证书，方法见仓库[how_to_install_crt_file](https://115.154.175.254:5200/gogs/rc-admin/how_to_install_crt_file)。
2. 登录账户，然后修改个人信息与密码，添加ssh公钥后，才可以通过本地git修改自己创建的仓库。
3. 如何提交作业见仓库[how_to_submit_assignments](https://115.154.175.254:5200/gogs/rc-admin/how_to_submit_assignments)。

- 用 CMake 管理项目。 1
- 用 Eigen 完成向量计算和矩阵求逆。 3
- 同时用 spdlog 输出日志到终端和 optimizer.log 中，以 debug 级别记录每一步迭代的结果（从 x0 到 x∗ ）
，以info 级别记录得到的最小值。所有向量和数值直接输出，不加任何描述。 4
- 不允许引入任何其他的库。2

# 学习的参考资料

## cmake学习资料推荐

以下资料均为github项目或者类似gitbook的电子书

1. [Cmake-Example github.io](https://sfumecjf.github.io/cmake-examples-Chinese/)

2. [Modern Cmake中文版](https://modern-cmake-cn.github.io/Modern-CMake-zh_CN/)

3. [一些经验](https://paakmau.github.io/202201042338/)

4. [CMake C++ Project Template](https://github.com/kigster/cmake-project-template)

## git 学习资料推荐

[🥡Git 菜单: 高质量的 Git 中文教程，源于国外社区的优秀文章和个人实践](https://selierlin.github.io/git-recipes/#/)
