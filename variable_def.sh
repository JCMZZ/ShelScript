# !/bin/bash
# Shell 变量

# 变量的命名规则：
# 1.命名只能使用英文字母，数字和下划线，首个字符不能以数字开头；
# 2.中间不能有空格，可以使用下划线（_）；
# 3.不能使用标点符号
# 4.不能使用bash里的关键字（可用help命令查看保留关键字）
# !!! 注意，等号与变量名和值之间都不能有空格

# 以下命令执行，shell将variable_space当做命令来执行 Err:command not found
# variable_space = "Variables with spaces" 

# 以下命令执行，shell将Variables with spaces当做命令来执行 Err:command not found
# variable_space= "Variables with spaces"

# 以下命令执行，shell将ls当做命令来执行  Succ:直接输出工作目录下的内容，未进行变量定义
# variable_space= "ls"

# 合法的变量定义
variable_space="Variables without spaces"
echo $variable_space

######## 常用内置变量 ########
# $0：当前脚本的文件名。
# $n：n是一个数字，表示第几个参数。
# $#：传递给脚本或函数的参数个数。
# $*：传递给脚本或函数的所有参数。当被双引号""包含时，会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
# $@：传递给脚本或函数的所有参数。当被双引号""包含时，仍然将每个参数都看作一份数据，彼此之间是独立的。
# $?：上个命令的退出状态，或函数的返回值。
# $$：当前Shell的进程ID。对于Shell脚本，就是这些脚本所在的进程ID。

