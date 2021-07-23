#!/bin/bash
# test

####### 数值 #######
a=10
b=20

if test $[a] -eq $[b]
then 
  echo "a equals b."
else
  echo "a is not equal to b"
fi
echo 

if [ $a -eq $b ]
then 
  echo "a equals b."
else
  echo "a is not equal to b"
fi
echo

if [ $a == $b ]
then 
  echo "a equals b."
else
  echo "a is not equal to b"
fi
echo

if [[ $a == $b ]]
then 
  echo "a equals b."
else
  echo "a is not equal to b"
fi
echo

####### 数值 #######
c=abc
d=cbd

if test $c = d
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi
echo 

if test $c == d
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi
echo 

if [ $c = $d ]
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi
echo

if [ $c == $d ]
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi
echo

if [[ $c = $d ]]
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi
echo 

if [[ $c == $d ]]
then 
  echo "c equals d."
else
  echo "c is not equal to d"
fi

# shell中各种括号的使用 # https://www.cnblogs.com/qlqwjy/p/8684630.html
