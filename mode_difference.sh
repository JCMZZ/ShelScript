#!/bin/bash
# Shell的运行方式和区别
# Bash手册： https://www.gnu.org/software/bash/manual/bash.html#SEC_Contents
# 参考教程：https://www.runoob.com/linux/linux-shell.html

# 子Shell方式：
# ./shell文件名
# /bin/sh shell文件名（shell文件作为解释器参数执行）

# 全局Shell方式：
# source shell文件名
# . shell文件名

# 定义测试变量
variable_hello_world="hello world"
# 变量输出到终端
echo $variable_hello_world


# 区别：
# 1.使用子Shell运行方式，当shell脚本执行完毕后，shell内所定义的变量、函数等，将会被销毁。
# 2.使用全局Shell运行方式，当shell脚本执行完毕后，shell内所定义的变量、函数等，将会被保留。
# 3.子Shell运行是由当前进程创建一个子进程，执行脚本
# 4.全局Shell运行是不另外创建子进程，而是在当前的的Shell环境中执行

# 输出内置环境变量$$，验证以上第3和4描述（$$表示当前执行进程的Shell ID）
echo $$