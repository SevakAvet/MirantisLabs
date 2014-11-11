#!/bin/bash

source ~/settings.conf

filename=$(date +"%Y-%m-%e.bak")

zip -9 -r $filename ~/$subdir
mv $filename /tmp