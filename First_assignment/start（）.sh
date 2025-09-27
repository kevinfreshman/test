#!/bin/bash
#这是一个 bash 脚本的起始行（shebang），用于指定脚本使用 /bin/bash 解释器执行
#不过，这也可以没有，如其他两个
gnome-terminal -- bash -c "source $(pwd)/install/setup.bash; ros2 run cpp_tf GazeboPosition; exec bash"
gnome-terminal -- bash -c "source $(pwd)/install/setup.bash; ros2 launch $(pwd)/launch/gazebo.launch.py; exec bash"
#通过 gnome-terminal 打开新终端，并在其中执行与 ROS 2 相关的操作，主要作用是启动不同的 ROS 2 组件