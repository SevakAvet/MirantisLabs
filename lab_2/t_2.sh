#!/bin/bash

if [ -z $1 ]; then
  whoami
else
  echo "$1"
fi
