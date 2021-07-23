# !/bin/bash
# 各种括号
# blog: https://www.cnblogs.com/qlqwjy/p/8684630.html

############### 单小括号 () ###############
# 1.命令组：括号中的命令将会新开一个子shell顺序执行，
#   所以括号中的变量不能够被脚本余下的部分使用。
#   括号中多个命令之间用分号隔开，最后一个命令可以没有分号，各命令和括号之间不必有空格。
(var=test;echo $var) # test
echo $var
echo --------------1\(\)

# 2.命令替换：等同于`cmd`，shell扫描一遍命令行，发现了$(cmd)结构，
#   便将$(cmd)中的cmd执行一次，得到其标准输出，再将此输出放到原来命令。
#   有些shell不支持，如tcsh。
str="love"
echo "I $(echo $str) you." # I love you.
echo "I `echo $str` you." # I love you.
echo --------------

# 3.用于初始化数组。如：array=(a b c d)
array=(a b c d)
echo "The first element of array: "$array. # The first element of array: a.
echo --------------2

############### 双小括号 (()) ###############
# 1.整数扩展：这种扩展计算是整数型的计算，不支持浮点型。
#   ((exp))结构扩展并计算一个算术表达式的值，如果表达式的结果为0，
#   那么返回的退出状态码为1，或者 是"假"，
#   而一个非零值的表达式所返回的退出状态码将为0，或者是"true"。
#   若是逻辑判断，表达式exp为真则为1,退出状态码为0，
#   假则为0，退出状态码为1
((0+0)) # 为false
echo $? # 1
((1+0)) # 为true
echo $? # 0
((double_brackets_sum=1+0)) # 为true
echo $? # 0
echo "double_brackets_sum: "$double_brackets_sum # double_brackets_sum: 1
((1>=0))# 为true
echo $? # 0
((1<0)) # 为false
echo $? # 1
echo --------------1\(\(\)\)

# 2.只要括号中的运算符、表达式符合C语言运算规则，都可用在$((exp))中，包括三目运算符。
#   作不同进位(如二进制、八进制、十六进制、自定义进制)运算时，输出结果全都自动转化成了十进制。
#   如：echo $((16#5f)) 结果为95 (16进位转十进制)
echo $((((1<2))?2:1)) # 2
echo $((((1>2))?100:2)) # 2
echo $((16#f)) # 15
echo $((8#17)) # 15
echo $((2#1111)) # 15
echo $((3#120)) # 15
#   注意：$(())只能返回整数值，与函数返回值规则相同
# echo $((((1>2))?100:2.1)) # Err: invalid arithmetic operator (error token is ".1")
echo $((((1>2))?100:A)) # 0
# echo $((((1>2))?100:"")) # Err: operand expected (error token is """")
echo --------------2

# 3.单纯用 (()) 可重定义变量值，比如 a=5; ((a++)) 可将 $a 重定义为6
double_brackets_n=5
((double_brackets_n++))
echo $double_brackets_n # 6
echo --------------3

# 4.常用于算术运算比较，双括号中的变量可以不使用$符号前缀。
#   括号内支持多个表达式用逗号分开。
#   只要括号中的表达式符合C语言运算规，
#   比如可以直接使用for((i=0;i<5;i++)), 
#   如果不使用双括号, 则为for i in `seq 0 4`或者for i in {0..4}。
#   再如可以直接使用if (($i<5)), 如果不使用双括号, 则为if [ $i -lt 5 ]。
for((double_brackets_i=0;double_brackets_i<5;double_brackets_i++))
do
  echo $double_brackets_i # 循环输出 0 1 2 3 4
done 
if (($double_brackets_i<5))
then 
  echo "[ double_brackets_i -lt 5  ]"
else 
  echo "[ double_brackets_i -gt 5  ]" # 此行输出
fi
echo --------------4

############### 单中括号 [] ###############
# 1.bash的内部命令，[和test是等同的。
#   如果我们不用绝对路径指明，通常我们用的都是bash自带的命令。
#   if/test结构中的左中括号是调用test的命令标识，右中括号是关闭条件判断的。
#   这个命令把它的参数作为比较表达式或者作为文件测试，并且根据比较的结果来返回一个退出状态码。
#   if/test结构中并不是必须右中括号，但是新版的Bash中要求必须这样。
type [ # [ is a shell builtin
[ 1 -gt 0 ] # 为true
echo $? # 0
test 1 -gt 0 # 为true
echo $? # 0
test 1 -gt 0 -a a=a # 为true
echo $? # 0
single_middle_n=1
test $[single_middle_n] -eq 0 # 为 false
echo $? # 1
echo --------------1\[\]

# 2.test和[]中可用的比较运算符只有=和!=，两者都是用于字符串比较的，
#   不可用于整数比较，整数比较只能使用-eq，-gt这种形式。
#   无论是字符串比较还是整数比较都不支持大于号小于号。
#   如果实在想用，对于字符串比较可以使用转义形式，
#   如果比较"ab"和"bc"：[ ab \< bc ]，结果为真，也就是返回状态为0。
#   [ ]中的逻辑与和逻辑或使用-a 和-o 表示。且[]前后都有空格。
[ ] # 为false
echo $? # 1
[ A = B ] # 为false
echo $? # 1
[ A=B ] # 为true，此处将A=B作为一个字符串处理
echo $? # 0
[ ab \< bc ] # 为true，此处拿两个串的单个字符unicode码自左向右逐个进行比较
echo $? # 0
[ 1 -eq 1 -a 1 -eq 0 ] # 为false
echo $? # 1
echo --------------2

# 3.字符范围：用作正则表达式的一部分，描述一个匹配的字符范围。
#   作为test用途的中括号内不能使用正则。
ls | grep ^[b].* # 输出文件名首字母为b的名称
echo --------------3

# 4.在一个array 结构的上下文中，中括号用来引用数组中每个元素的编号。
single_middle_array=(1 2)
echo ${single_middle_array[0]} # 1
single_middle_array[2]=3
echo ${single_middle_array[2]} # 3
echo --------------4

############### 双中括号 [[]] ###############
# 1.[[ 是bash程序语言的关键字，并不是一个命令，[[ ]] 结构比[ ]结构更加通用。
#   在[[和]]之间所有的字符都不会发生文件名扩展或者单词分割，但是会发生参数扩展和命令替换。

# 文件名扩展
echo {1..4}.go
# if [ {1..4}.go != "1.go 2.go 3.go 4.go" ] # Err: [: too many arguments
if [[ {1..4}.go != "1.go 2.go 3.go 4.go" ]]
then 
  echo "Yes." # 此行输出 
else
  echo "No." 
fi  

# 单词分割
double_middle_str="hello world"
# if [ $double_middle_str = "hello world" ] # Err: [: too many arguments
if [[ $double_middle_str = "hello world" ]]
then 
  echo "Yes." # 此行输出
else
  echo "No."
fi  

# 参数扩展 
function double_middle_func()
{
  # 以下命令尝试打印函数接收的第1个和第11个参数
  echo $1 $11   # 10 101
  echo $1 ${11} # 10
}
double_middle_func 10

girl=girl
echo a $girlfriend # a
echo a ${girl}friend # a girlfriend

# 命令替换
echo "I want to have a $(echo $girl)griend."
echo "I want to have a `echo $girl`griend."

function double_middle_test()
{
  double_middle_first=$1
  if [[ $11 = "$(echo $double_middle_first)1" ]]
  then 
    echo "Yes." # 此行输出
  else
    echo "No."
  fi
}
double_middle_test 10
echo --------------1\[\[\]\]

# 2.支持字符串的模式匹配，使用=~操作符时甚至支持shell的正则表达式。
#   字符串比较时可以把右边的作为一个模式，而不仅仅是一个字符串，
#   比如[[ hello == hell? ]]，结果为真。
#   [[ ]] 中匹配字符串或通配符，不需要引号。
[[ "I love you." =~ ^I" "[a-z]+" "you. ]] # 为true
echo $? # 0
[[ aa = [a-z]* ]] # 为true
echo $? # 0
echo --------------2

# 3.使用[[ ... ]]条件判断结构，而不是[ ... ]，能够防止脚本中的许多逻辑错误。
#   比如，&&、||、<和> 操作符能够正常存在于[[ ]]条件判断结构中，
#   但是如果出现在[ ]结构中的话，会报错。
#   比如可以直接使用if [[ $a != 1 && $a != 2 ]], 
#   如果不使用双括号, 则为if [ $a -ne 1] && [ $a != 2 ]
#   或者if [ $a -ne 1 -a $a != 2 ]。
[[ a > b ]] # 为false
echo $? # 1
[[ 10 != 1 && 10 != 2 ]] # 为true
echo $? # 0
# 以下命令等同于以上命令
[ 10 -ne 1 ] && [ 10 != 2 ] # 为true
echo $? # 0
# 以下命令等同于以上命令
[ 10 -ne 1 -a 10 != 2 ] # 为true
echo $? # 0
echo --------------3

# 4.bash把双中括号中的表达式看作一个单独的元素，并返回一个退出状态码。
[[ -b /bin/bash ]] # 为false /bin/bash 不是一个块文件
echo $? # 1
echo --------------4

############### 大/花括号 {} ###############
## 1、常规用法
# 1.大括号拓展。(通配(globbing))将对大括号中的文件名做扩展。
#   在大括号中，不允许有空白，除非这个空白被引用或转义。
#   第一种：对大括号中的以逗号分割的文件列表进行拓展。
#   如 touch {a,b}.txt 结果为a.txt b.txt。
#   第二种：对大括号中以点点（..）分割的顺序文件列表起拓展作用，
#   如：touch {a..d}.txt 结果为a.txt b.txt c.txt d.txt
echo { } # { }
echo {a,b}.go # a.go b.go
echo {a..c}.go # a.go b.go c.go

# 2.代码块，又被称为内部组，这个结构事实上创建了一个匿名函数。
#   与小括号中的命令不同，大括号内的命令不会新开一个子shell运行，
#   即脚本余下部分仍可使用括号内变量。
#   括号内的命令间用分号隔开，最后一个也必须有分号。
#   {}的第一个命令和左括号之间必须要有一个空格。
#   {}也可以用于多行注释，作为函数包起来只是不调用即可。
{ big_brackets="I will be a global variable.";runtime_id=$$;}
if [ $runtime_id == $$ ]
then # 此程序块执行
  echo "Useing the same process: $$."
  echo $big_brackets
else 
  echo "Useing different process, current: $$, big_brackets runtime: $runtime_id."
fi
echo --------------1\{\}

## 2、几种特殊的替换结构 ${var:-string},${var:+string},${var:=string},${var:?string}
# 1.${var:-string}和${var:=string}:若变量var为空，
#   则用在命令行中用string来替换${var:-string}，否则变量var不为空时，
#   则用变量var的值来替换${var:-string}；
#   对于${var:=string}的替换规则和${var:-string}是一样的，
#   所不同之处是${var:=string}若var为空时，用string替换${var:=string}的同时，
#   把string赋给变量var： ${var:=string}很常用的一种用法是，
#   判断某个变量是否赋值，没有的话则给它赋上一个默认值。
echo "I "${not_def:-"love you."} # I love you.
echo $not_def # 输出空
big_brackets_hate="hate u."
echo "I "${big_brackets_hate:-"love you."} # I hate u.

echo "I "${big_brackets_runtime:="love you."} # I love you.
echo $big_brackets_runtime # love you.

# 2.${var:+string}的替换规则和上面的相反，
#   即只有当var不是空的时候才替换成string，
#   若var为空时则不替换或者说是替换成变量var的值，即空值。
#   (因为变量var此时为空，所以这两种说法是等价的)
echo "I "${big_brackets_hate:+"love you."} # I love you.
echo $big_brackets_hate # hate u.
echo "I "${not_def:+"love you."} # I

# 3.${var:?string}替换规则为：若变量var不为空，
#   则用变量var的值来替换${var:?string}；
#   若变量var为空，则把string输出到标准错误中，并从脚本中退出。
#   可利用此特性来检查是否设置了变量的值。
echo "I "${big_brackets_hate:?"Something went wrong."} # I hate u.
# echo "I "${not_def:?"Something went wrong."} # Err: not_def: Something went wrong.

## 扩展：以上四种替换结构中string不一定是常值的，可用另外一个变量的值或是一种命令的输出。
echo --------------2

## 3、四种模式匹配替换结构 ${var%pattern},${var%%pattern},${var#pattern},${var##pattern}
# 模式匹配记忆方法：
# # 是去掉左边(在键盘上#在$之左边)
# % 是去掉右边(在键盘上%在$之右边)
# #和%中的单一符号是最小匹配，两个相同符号是最大匹配。
# 1. 第一种模式：${variable%pattern}，这种模式时，
#   shell在variable中查找，看它是否以给的模式pattern结尾，
#   如果是，就从命令行把variable中的内容去掉右边最短的匹配模式
big_brackets_parttern1="abcabcdbcd"
big_brackets_parttern2="zabcabcdbcde"
echo ${big_brackets_parttern1%b*d} # abcabcd 
echo ${big_brackets_parttern2%b*d} # zabcabcdbcde

# 2.第二种模式： ${variable%%pattern}，这种模式时，
#   shell在variable中查找，看它是否以给的模式pattern结尾，
#   如果是，就从命令行把variable中的内容去掉右边最长的匹配模式
echo ${big_brackets_parttern1%%b*d} # a 
echo ${big_brackets_parttern2%%b*d} # zabcabcdbcde

# 3.第三种模式：${variable#pattern} 这种模式时，
#   shell在variable中查找，看它是否以给的模式pattern开始，
#   如果是，就从命令行把variable中的内容去掉左边最短的匹配模式
echo ${big_brackets_parttern1#a*c} # abcdbcd
echo ${big_brackets_parttern2#a*c} # zabcabcdbcde

# 4.第四种模式： ${variable##pattern} 这种模式时，
#   shell在variable中查找，看它是否以给的模式pattern结尾，
#   如果是，就从命令行把variable中的内容去掉右边最长的匹配模式
echo ${big_brackets_parttern1##a*c} # d
echo ${big_brackets_parttern2##a*c} # zabcabcdbcde

## 扩展：这四种模式中都不会改变variable的值，其中，只有在pattern中使用了*匹配符号时，
#  %和%%，#和##才有区别。结构中的pattern支持通配符，*表示零个或多个任意字符，
#  ?表示仅与一个任意字符匹配，[...]表示匹配中括号里面的字符，
#  [!...]表示不匹配中括号里面的字符。
echo --------------3

## 4、字符串提取和替换：${var:num},${var:num1:num2},${var/pattern/pattern},${var//pattern/pattern}
# 1.第一种模式：${var:num}，这种模式时，
#   shell在var中提取第num个字符到末尾的所有字符。
#   若num为正数，从左边0处开始；
#   若num为负数，从右边开始提取字串，
#   但必须使用在冒号后面加空格或一个数字或整个num加上括号，
#   如${var: -2}、${var:1-3}或${var:(-2)}。
big_brackets_string="abcdef"
echo ${big_brackets_string:2} # cdef
echo ${big_brackets_string:6} # 输出空
echo ${big_brackets_string: -2} # ef
echo ${big_brackets_string:(-2)} # ef
echo ${big_brackets_string:0-2} # ef
echo ${big_brackets_string:0-7} # 输出空

# 2.第二种模式：${var:num1:num2}，num1是位置，num2是长度。
#   表示从$var字符串的第$num1个位置开始提取长度为$num2的子串。不能为负数。
echo ${big_brackets_string:2:2} # cd
echo ${big_brackets_string:2:10} # cdef
echo ${big_brackets_string:6:10} # 输出空

# 3.第三种模式：${var/pattern/pattern}
#   表示将var字符串的第一个匹配的pattern替换为另一个pattern。
echo ${big_brackets_string/abc/def} # defdef
echo ${big_brackets_string/abc/www} # wwwdef
echo ${big_brackets_string/www/www} # abcdef

# 4.第四种模式：${var//pattern/pattern}
#   表示将var字符串中的所有能匹配的pattern替换为另一个pattern。
big_brackets_string1=abbbbc
echo ${big_brackets_string1//b/w} # awwwwc
echo ${big_brackets_string1//bb/w} # awwc
echo ${big_brackets_string1//w/w} # abbbbc
echo --------------4

############### $后的括号 ###############
# 1.${variable} 变量取值，${a} 变量a的值, 在不引起歧义的情况下可以省略大括号。
echo "The environment variable value of PATH: "${PATH}

# 2.$(cmd) 命令替换，和`cmd`效果相同，
#   结果为shell命令cmd的输，某些Shell版本不支持$()形式的命令替换, 如tcsh。
echo "List of current catalog files: $(ls -al | grep ^d | awk '{printf "\n\t%s",$0}')"

# 3.$((expression)) 和`exprexpression`效果相同, 计算数学表达式exp的数值, 其中exp只要符合C语言的运算规则即可, 包括三目运算符和逻辑表达式都可以计算。
dollar_after_n=$((1+2))
echo $dollar_after_n # 3
dollar_after_logic=$((1==2))
echo $dollar_after_logic # 0
echo $? # 0
# 注意$(())：还是仅支持返回整数
echo $((1 != 1?0:1)) # 1
echo $? # 0
echo $((abc == abc)) # 1
echo $((abc)) # 0
echo $(()) # 0
echo $((ls -al == ls -la)) # 1

echo --------------\$
