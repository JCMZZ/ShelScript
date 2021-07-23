# !/bin/bash
# Shell 变量使用、删除

########## 使用一个定义过的变量 ##########
variable="Hello World"
echo ${variable}
# 花括号是可选的，是为了帮助解释器识别变量的边界
echo $variable

km="20"
echo "have ${km}Km." # have 20Km.
# 执行以下命令，shell会将kmKm整体做为一个变量输出，由于kmKm未定义所以输出空
echo "have $kmKm." # have . 
# 当在一个句子中引用变量时，不使用花括号，则shell会按照变量的命名规则自动识别出一个变量，进行使用
echo "have $km Km." # have 20 Km.
echo "have $km_Km." # have .
echo "have $km." # have 20.

########## 使用一个未定义的变量 ##########
empty=""

echo $not_def
# 以上命令等同于以下命令
echo
echo $empty

# 变量值为空的empty等同于未定义的变量not_def，因此未定义的变量都被解释为空
# if [[ $not_def != $empty ]] # No
# then
#   echo "Yes"
# else 
#   echo "No"
# fi

# if [[ $not_def = $empty ]] # Yes
# then
#   echo "Yes"
# else 
#   echo "No"
# fi

########## 删除一个变量 ##########
# unset variable_name
echo "Before deleting：${km}"
unset km
echo "After deleting：${km}"

