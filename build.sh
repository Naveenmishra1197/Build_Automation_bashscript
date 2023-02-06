#!/bin/bash
# Enter Zip file  directory location from local
#dir_origin="dayprise/*"
dir_origin="/home/user/XXX/*"
# Enter server username
username="frontend"

# Enter server build dir location 
dir_destination="/var/www/XXX.app/public_html/XXX-dev/"

# Enter IP of server
Ip="x.x.x.x.x"


#echo "Remove Previous build File from remote server."
ssh $username@$Ip " echo 'removing previous build-file' && cd /var/www/dayprise.app/public_html/dayprise-dev/ && rm -rf * "

#echo "Uploading files to remote server...."

#Using SCP command to file transfer from local to server
rsync -r $dir_origin $username@$Ip:$dir_destination


#echo "Permission to Build  File to remote server."
ssh $username@$Ip "echo 'Give permission to build file over prod-server' && chmod -R 755 /var/www/dayprise.app/public_html/dayprise-dev/* "
