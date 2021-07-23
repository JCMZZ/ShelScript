#!/bin/bash
# Shell的循环

########## For ##########
oldIFS=$IFS
IFS=$'\n';
for var in `ls -l | tail -n +2`
do
  echo $var
done
IFS=$oldIFS
echo ---------------

# 读取脚本收到的参数
for param in $*
do
  echo $param
done
echo ---------------

########## While ##########
count=0
while [ $count -le 100 ]
do
  let sum+=count
  let count++
done
echo $sum
echo ---------------

########## Until ##########
count1=0
until [ $count1 -gt 100 ]
do
  let sum1+=count1
  let count1++
done
echo $sum1
