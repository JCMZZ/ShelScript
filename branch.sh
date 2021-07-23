#!/bin/bash
# Shell的分支

score=77
########## If ##########
if [ $score -lt 60 ]
then  
  echo "C"
elif [ $score -ge 60 -a $score -le 80 ]
then 
  echo "B"
else 
  echo "A"
fi
echo

########## Case ##########
if [ $score -lt 60 ]
then
  level="<60"
elif [ $score -ge 60 -a $score -le 80 ]
then
  level=">=60&&<=80"
else
  level=">80"
fi

# case无法做比较以及测试命令
case $level in
"<60")
  echo "C"
  ;;
">=60&&<=80")
  echo "B"
  ;;
*)
  echo "A"
  ;;
esac


