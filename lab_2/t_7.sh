#!/bin/bash

n=$1
ans=1
cur=1

while (($cur <= $n)); do
  ans=$(($ans * $cur))
  cur=$(($cur + 1))
done

echo "$n! = $ans"
