#!/bin/bash

# Update CentOS with patches
yum update -y --exclude=kernel

# Tools
yum install -y git nano unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on 

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download starter content
cd /vagrant

sudo -u vagrant wget https://raw.githubusercontent.com/rarquiza/vagrant/master/files/index.html
sudo -u vagrant wget https://raw.githubusercontent.com/rarquiza/vagrant/master/files/info.php

service httpd restart
