#!/bin/bash
# 作为外部脚本

echo "From external script！"

function childFunc()
{
  echo "Hello, parent！"
  echo  -e "--\tThis is the parameters from you:"$*
  return 200
}


