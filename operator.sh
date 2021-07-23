#!/bin/bash
# Shell的运算符

########## 算术运算 ##########
a=10
b=20
echo `expr $a + $b`
echo `expr $a % $b` # 10
echo `expr $a == $b`
# 注意：expr 运算符两边要有空格
echo `expr $a+$b` # 10+20
echo --------------------

########## 关系运算 ##########
if [ $a -eq $b ] 
then
  echo "a equals b."
else 
  echo "a is not equals to b."
fi

if [ $a -lt $b ]
then 
  echo "a is less than b."
else 
  echo "a is greater than or equal to b."
fi
echo --------------------

########## 布尔运算 ##########
if [  ]
then
  echo "[  ]: true"
else
  echo "[  ]: false"
fi

if [ ! ]
then
  echo "[ ! ]: true"
else
  echo "[ ! ]: false"
fi

if [ $a -eq $b -a $a -le $b ]
then
  echo "[ \$a -eq \$b -a \$a -le \$b ]: true"
else
  echo "[ \$a -eq \$b -a \$a -le \$b ]:false"
fi
echo --------------------

########## 逻辑运算 ##########
if [[ $a -lt $b && $b -gt $a ]]
then
  echo "[[ \$a -lt \$b && \$b -gt \$a ]]: true"
else 
  echo "[[ \$a -lt \$b && \$b -gt \$a ]]: false"
fi
echo --------------------

########## 字符串运算 ##########
if [[ $a = $b ]]
then
  echo "a equals b."
else 
  echo "a is not equals to b."
fi

if [[ -z $a ]]
then  
  echo "The lehgth is 0."
else 
  echo "Length: ${#a}."
fi

if [[ -n "" ]]
then  
  echo "The string is not empty."
else 
  echo "The string is empty."
fi
echo --------------------

########## 文件测试运算 ##########
if [ -x "/bin/bash" ]
then
  echo "Executable."
else 
  echo "Inexecutable"
fi

if [ -f "/bin/bash" ]
then
  echo "Ordinary."
else 
  echo "Unordinary"
fi