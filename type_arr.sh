# !/bin/bash
# Shell 数据类型 -- 数组

######## 定义 ########
# 枚举式（元素之间以空格分割）
array_enum=(first  3 6 4 "last")
echo "Enumeration: $array_enum"

# 访问下标指定元素赋值(元素下标由0开始)
array_index[0]="first"
array_index[1]="second"
echo "Index: $array_index"

######## 操作 ########
# 访问
# ${array[index]}
echo "This is the ${array_enum[4]} element."

# 数组长度
echo "array_enum has ${#array_enum[*]} elements."

# 获取数组中所有元素
echo "All elements of array_enum: "${array_enum[*]}
echo "All elements of array_enum: "${array_enum[@]}
str="All elements of array_enum: `echo ${array_enum[*]}`"
echo $str



