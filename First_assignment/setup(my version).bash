# generated from colcon_bash/shell/template/prefix_chain.bash.em

# This script extends the environment with the environment of other prefix
# paths which were sourced when this file was generated as well as all packages
# contained in this prefix path.

# function to source another script with conditional trace output
# first argument: the path of the script
_colcon_prefix_chain_bash_source_script() {
  if [ -f "$1" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      echo "# . \"$1\""
    fi
    . "$1"
  else
    echo "not found: \"$1\"" 1>&2
  fi
}
#这段代码定义了一个名为 _colcon_prefix_chain_bash_source_script 的 Bash 函数
#主要作用是安全地加载（source）指定的脚本文件，并在特定条件下提供调试追踪信息

COLCON_CURRENT_PREFIX="/opt/ros/humble"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"


COLCON_CURRENT_PREFIX="$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)"
_colcon_prefix_chain_bash_source_script "$COLCON_CURRENT_PREFIX/local_setup.bash"

unset COLCON_CURRENT_PREFIX
unset _colcon_prefix_chain_bash_source_script
#主要作用是依次加载系统级和用户工作空间的 local_setup.bash 配置文件，并在完成后清理临时变量，确保环境配置的正确性和整洁性