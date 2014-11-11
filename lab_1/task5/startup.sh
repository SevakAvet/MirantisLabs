#!/bin/bash

cat bashrc.sh >> ~/.bashrc # При логине через su
cat sshrc >> /etc/ssh/sshrc # Для отправки почты при заходе по ssh
cp bashrc.sh /etc/init.d # При загрузке системы