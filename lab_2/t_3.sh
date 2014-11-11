#!/bin/bash

echo "------------------------------------------"
printf "%s\t%-20s\t%s\n" "USER" "COMAND" "%CPU"
echo "------------------------------------------"
ps aux | awk '{if ($3 > 0.0) printf "%s\t%-20s\t%.1f\n", $1, basename($11), $3}
				function basename(pn){sub(/^.*\//, "", pn); return pn}'