#!/bin/bash

export filename_pattern="./[a-zA-Z]*"
export text_pattern="[a-zA-Z]"

path_to_dirs=""
while read line; do
  path_to_dirs="${path_to_dirs} ${line}* "
done < ${dir_lst_file}

find . -type f -regex ${filename_pattern} | xargs grep -R ${text_pattern} ${path_to_dirs}