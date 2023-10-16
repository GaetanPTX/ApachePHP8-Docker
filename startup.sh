#!/bin/bash

if [ ! -d /config/html ]; then
    echo "HTML NOT Found"
    cp -R /var/www/html/ /config
else
    echo "HTML Found"
    cp -R /config/html/ /var/www/
fi

if [ ! -d /config/apache2 ]; 
then
    echo "CONFIG NOT Found!"
    cp -R /etc/apache2/ /config
else
    echo "CONFIG Found!"
    cp -R /config/apache2/ /etc/
fi

chmod -R 777 /config/html/
chmod -R 777 /config/apache2/


#cp -R /etc/apache2/ /config
#cp -R /var/www/html/ /config


while :; do rsync -a --delete /config/html /var/www/; sleep 1; done & apache2ctl -D FOREGROUND


