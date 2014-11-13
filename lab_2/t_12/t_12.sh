#!/bin/bash

function show_help() {
	echo "PrimeSieve - a programm finds prime numbers"
    echo -n N find all prime numbers less than N
    echo -N see -n
	echo -f FILE_NAME write all output to FILE_NAME
	echo -v verbose mode
	echo -h print h
}

#checks if there are any arguments by (ab)using the short-circuited OR
(( $# )) || echo "No arguments. Run $0 -h"

while getopts 'habc' opt; do
        case "$opt" in
            h)
                man ./primeseive_man
            ;;
            a)
                echo "sudo /path/to/other/script"
            ;;
            b)
                echo "do_some_stuff"
                echo "do_another_stuff"
            ;;
            c)
                echo "do_extremely_fancy_stuff"
                echo "do_another_extremely_fancy_stuff"
                echo "run_as_many_commands_as_you_want"
            ;;
            *)
                echo "Run $0 --help"
            ;;
        esac
done

function isPrime {
  i=2
  while (( i * i <= $1 )); do
    if (( $1 % $i == 0 )); then
      return 1
    fi
    (( i += 1))
  done

  return 0
}

function main {
	typeset a i=2 j m=$1
	while (( i <= m )); do
		a[$i]=$i
		(( i++ ))
	done

	i=2
	while (( j = i * i, j <= m )); do
		if [[ -n ${a[$i]} ]]; then
			while (( j <= m )); do
				unset a[$j]
				(( j += i ))
			done
		fi
		(( i++ ))
	done
	echo ${a[*]}
}