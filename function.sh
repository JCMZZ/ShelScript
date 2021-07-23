#!/bin/bash
# Shell Function https://www.cnblogs.com/cxhfuujust/p/7560817.html
 
####### 函数定义 #######
function noReturn()
{
  echo "No output！"
}

noReturn

# 1.函数返回值只能是整数值
function hasReturn()
{
  echo "The program has a return."
  return 2
}

hasReturn

# 2.在函数中使用exit命令，可以退出整个脚本，exit 后面的命令将不被执行
function hasBreak()
{
  echo "Before."
  exit 1
  echo "After"
  return 2
}

hasBreak

# 函数传参
function hasParam(){
  echo "Parameters: "$*
  echo "Parameter Length: "${#*}
}
hasParam 1 2 3 4 5 6

####### 函数操作 #######
# declare –f 可以显示定义的函数清单
# declare –F 可以只显示定义的函数名
# unset –f 可以从Shell内存中删除函数
