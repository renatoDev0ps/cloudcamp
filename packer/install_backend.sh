#!/bin/bash

#add swap para micro
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo chmod 600 /var/swap.1
/sbin/swapon /var/swap.1
sudo echo "/var/swap.1   none   swap  sw  0  0" | sudo tee -a /etc/fstab

echo "Instalando dependencias"
sudo apt-get update
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update
sudo apt install php7.1 php7.1-xml php7.1-mbstring php7.1-mysql php7.1-json php7.1-curl php7.1-cli php7.1-common php7.1-mcrypt php7.1-gd libapache2-mod-php7.1 php7.1-zip awscli -y
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/bin/composer
sudo a2enmod rewrite
sudo chmod -R 775 /var/www/
sudo chown -R www-data:www-data /var/www/


sudo apt update

# instalando Ruby
sudo apt install -y ruby

# CodeDeploy Agent
cd /home/ubuntu
sudo wget https://aws-codedeploy-eu-central-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# ativando codedeploy e verificando status
sudo systemctl start codedeploy-agent
sudo systemctl status codedeploy-agent
echo "Fim de instalacao das Dependencias"