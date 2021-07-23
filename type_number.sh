# !/bin/bash
# Shell 数据类型 -- 数值

######## 定义 ########
# Shell中所有的变量默认都是字符串型
num="1"
if [[ $[$num + $num] == $[$num] ]] # No
then
  echo Yes
else 
  echo No
fi

str=number
echo $(($num+$str)) # 1
echo $(($num+$num)) # 2
echo --------------
# 运算
expr $num + $num
expr $num \> $num # 0
expr $num \>= $num # 1
let sum=$num+$num
echo $sum
echo $[$num+$num]
echo $(($num+$num))


