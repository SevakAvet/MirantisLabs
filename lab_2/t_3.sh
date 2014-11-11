#!/bin/bash

count=0

ps aux | while read line; do
  arr=($line)
  let "count += 1"

  if [ "${count}" -eq 1 ]; then
    echo "----------------------------------------------------------------"
    printf "%s\t%-20s\t%s\n" "USER" "COMAND" "%CPU"
    echo "----------------------------------------------------------------"
  elif [ $(echo "if (${arr[2]} > 0.0) 1 else 0" | bc) -eq "1" ]; then
    printf "%s\t%-20s\t%.1f\n" ${arr[0]} $(basename ${arr[10]}) ${arr[2]}
  fi
done
