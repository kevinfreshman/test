# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#$开头的字符为变量名，名字可以使用扩展
#${!strang*}指的是变量扩展，即以strang开头的所有变量
#$(...)可以扩展成另一个命令的运行结果，该命令的所有输出都会作为返回值
case $- in
    *i*) ;;
      *) return;;
esac
#这段代码的目的是避免在非交互方式下执行特定的代码，以确保脚本在交互模式下运行时才执行相关操作。
#有return说明这是一个父shell的子shell

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
#ignoreboth是ignorespace和ignoredups的缩写。其中，ignorespace表示以空白字符开头的命令不会被记入历史记录，ignoredups表示连续且相同的命令不会被重复记录。因此，当设置HISTCONTROL=ignoreboth时，这两种情况都会被忽略。
#据说，因为环境变量是大写的，所以习惯以大写来命名变量

# append to the history file, don't overwrite it
shopt -s histappend
#$ shopt -s [optionname]的意思是打开某个参数
#当通过 shopt -s histappend 启用该选项时，新的命令历史（比如当前终端会话中执行的命令）会以 “追加” 的方式写入历史文件（默认是 ~/.bash_history），不会影响文件中已有的历史记录。

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
#HISTSIZE控制当前 shell 会话中保存的历史命令数量
#HISTFILESIZE控制保存到历史记录文件中的命令条目数量
#不论是不是数字，都是字符串

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
#checkwinsize用于启用「自动检查窗口大小」的功能

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
#不是，兄弟，你也没用到**，没有必要来shopt

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#判断 /usr/bin/lesspipe 这个文件是否存在且可执行
#目的是当系统中存在可执行的lesspipe脚本时，通过该命令加载其配置，让less命令支持更丰富的文件格式处理（例如直接用less file.tar.gz查看压缩包内容）

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
#这行代码将 /etc/debian_chroot 文件的内容读取出来，并赋值给 debian_chroot 变量
#在 Debian 或 Ubuntu 系统中，这个变量通常用于标识当前是否在 chroot 环境中运行。如果系统处于 chroot 环
#/etc/debian_chroot 文件会包含相应的标识信息，这段代码会读取该信息并设置到环境变量中，供后续的命令提示符等场景使用

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
#只有一个条件，为啥要用case,直接用if也可以吧（虽然多个也可以用if)

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#下面用于判断force_color_prompt是否有值 
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    #这里是相当于把color_prompt重置了，与unset等价
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
#重置了这两个变量，变量中间用空格隔开
#根据终端是否支持颜色，决定是否使用彩色命令提示符

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
#当使用 xterm 或 rxvt 类终端时，会同时设置终端窗口标题为 "用户名 @主机名：当前目录"，而命令提示符保持不变（因为最后加上了原 PS1）
#对于其他类型的终端，则不做任何修改。

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #先检查用户是否有自定义的 .dircolors 配置文件
    #有则加载用户配置，无则加载系统默认配置
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#当系统支持 dircolors 工具时，加载文件颜色配置（优先用户自定义），并为 ls、grep 等命令设置别名，让它们在终端中自动显示彩色输出
#alias 用于给变量别名
#逻辑运算：两个命令组合符 && 和 ||

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
#每次启动终端时，系统会自动检查并加载用户的别名配置，使定义在 .bash_aliases 中的命令别名生效
#此处出现~扩展，用于表示.bash_aliases所在的目录

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#作用是在非 POSIX 模式下加载 Bash 自动补全配置，以启用命令行自动补全功能。
# >>> fishros initialize >>>
source /opt/ros/humble/setup.bash
# <<< fishros initialize <<<


export GAZEBO_PLUGIN_PATH=/opt/ros/humble/lib


export LD_LIBRARY_PATH=/opt/ros/humble/lib
#这段代码是 ROS（机器人操作系统）和 Gazebo 仿真环境的配置脚本
#主要用于设置运行 ROS Humble 版本和 Gazebo 所需的环境变量，确保相关工具和库能被正确识别
#这是将变量输出，使子shell可以继承（话说，哪里来的子shell?)
