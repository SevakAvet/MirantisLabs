crontab -l > mycron
echo "0,30 * * * * rm -rf /tmp" >> mycron
crontab mycron
rm mycron
