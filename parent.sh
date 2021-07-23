#!/bin/bash
# 作为Parent脚本

# source ./child.sh
. ./child.sh
# ./child.sh # Err: childFunc: command not found
childFunc a b c 1 2 3
result=$?
echo "Return value of childFunc: "$result