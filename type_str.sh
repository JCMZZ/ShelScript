# !/bin/bash
# Shell 数据类型 -- 字符串

######## 定义 ########
# 无引号(不支持内容中夹带空格，不支持转义字符，支持变量引用)
no_quotation_marks=NoQuotationMarks
echo "Without quotation marks：${no_quotation_marks}."

variable_without=Hello_World_$$\n\tI_Love_You.
echo $variable_without
echo --------

# 单引号(不支持变量引用，支持转义字符，支持空格)
single_quotation_marks='Single quotation marks'
echo "With single quotation marks：${single_quotation_marks}."

variable_single='Hello World $$\n\tI Love You.'
echo $variable_single
echo --------

# 双引号(支持空格，支持变量引用，支持转义)
double_quotation_marks="Double quotation marks"
echo "With double quotation marks：${double_quotation_marks}."

variable_double="Hello World $$\n\tI Love You"
echo $variable_double

your_name="Shell"
variable_double_say="Hello, I know you are \"$your_name\"!"
echo $variable_double_say
echo --------

######## 操作 ########
# 字符串拼接
hello=hello
world=' World'
line_feed="\n"
echo $line_feed
second_line='The second line.'
echo $hello$world$line_feed$second_line"\nThe third line."

# 获取字符串长度
echo ${#world} # 6
echo ${#line_feed} # 2

# 查找字符位置
# expr index $hello "o"



