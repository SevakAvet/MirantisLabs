#!/bin/bash

username=$(whoami)
hour=$(date +"%H")
day=$(date +"%d")
month=$(date +"%m")
dayOfWeek=$(date +"%u")
((dayOfWeek = dayOfWeek % 7))

line="* $hour $day $month $dayOfWeek date +\"\%D \%H:\%M:\%S\" >> ~/date.test"
(crontab -u $username -l; echo "$line" ) | crontab -u $username -
