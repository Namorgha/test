#!/bin/bash

wget  https://www.adminer.org/latest.php -O /var/www/html/index.php

wget https://raw.githubusercontent.com/vrana/adminer/master/designs/galkaev/adminer.css -P /var/www/html

php -S 0.0.0.0:8080 -t /var/www/html
