# !/bin/bash
# Printf Echo

######### echo #########
# 输出字符串
echo "this is string."
# 输出变量信息
str=string
echo "this is $str."
# 输出带转义的信息
echo -e "this is:\n\t$str."
# 输出命令结果
echo $(date)
echo `date`
echo -------------------

######### printf #########
printf "this is $str.\n"

# %s 字符串
printf "this is %s.\n" $str 

# %d 整数
arr=(1 2 3 4)
printf "arr has %d elements.\n" ${#arr[*]}
printf "This is the index of arr: %d.\n" ${!arr[@]}

# %f 小数
printf "Bash shell accounts for %f%% of all shell.\n" 51.555
printf "Keep three decimal places: %.3f\n" 51.5555

