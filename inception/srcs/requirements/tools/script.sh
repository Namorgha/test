#!/bin/bash

echo "MYSQL_ROOT_PASSWORD=$(cat ./secrets/db_root_password.txt)" >> ./srcs/.env 
echo "MYSQL_PASSWORD=$(cat ./secrets/db_password.txt)" >> ./srcs/.env

