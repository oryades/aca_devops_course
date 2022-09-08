#! /bin/bash

sudo apt update

# Install zip and unzip .....................
sudo apt install -y zip
sudo apt install -y unzip

# By default Ubuntu 22 Image ami-052efd3df9dad4825 comes with apach, stopping...
sudo systemctl stop apache2

# Installing nginx ..........................
sudo apt install -y nginx
sudo systemctl enable nginx

# Installing packs to be able install PHP with certain version ....................
sudo apt install -y ca-certificates apt-transport-https software-properties-common
sudo add-apt-repository ppa:ondrej/php

# Update before installing PHP ...............
sudo apt update

# Installing PHP with all necessary extensions and mysql client
sudo apt install -y php8.0 php8.0-imagick php8.0-json php8.0-zip php8.0-gd php8.0-mbstring php-xml php8.0-common php8.0-mysql
sudo apt install -y php8.0-fpm
sudo apt install -y mysql-client ysql-client-core-8.0

# Stop inginx for configuration
sudo systemctl stop nginx

# Add ubuntu user to www-data group
usermod -a -G www-data ubuntu

# Set ubuntu:www-data owners to /var/www
chown -R ubuntu:www-data /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;

# Change dir to /var/www/html to download wordpress and unzip
cd /var/www/html
sudo wget https://wordpress.org/latest.zip
sudo unzip latest.zip

# In case wordpress should be located directly in the /html
# unzip archive.zip folder/*; mv folder/* .;rm -r folder

# Set ubuntu:www-data owner to /var/www/html
chown -R ubuntu:www-data /var/www/html
chmod -R 774 /var/www/html

# Remove index.html to avoid index.php conflict
rm /var/www/html/index.html

# Configuring nginx, using the moved nginx.default 
sudo chmod 0600 /tmp/nginx.sh
sudo cp -f /tmp/nginx.default /etc/nginx/sites-available/default

# Start nginx
sudo systemctl start nginx

# Creating index.php in the root directory with PHP information
sudo touch /var/www/html/index.php
sudo chmod 0644 /var/www/html/index.php
echo "<?php phpinfo();" | sudo tee --append /var/www/html/index.php

# Update packages..............
sudo apt update