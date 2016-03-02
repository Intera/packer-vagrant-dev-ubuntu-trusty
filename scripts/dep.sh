#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update

apt-get -y install curl

# You can install anything you need here.

apt-get -y dist-upgrade

apt-get -y install language-pack-de

apt-get -y install postfix mailutils

apt-get -y install vim-nox mc screen htop curl wget rsync dos2unix

apt-get -y install openssh-client openssh-sftp-server

apt-get -y install cron

apt-get -y install git

apt-get -y install graphicsmagick

# Install SaltStack and its requirements
wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list
apt-get -y update
apt-get install -y salt-minion salt-ssh

# Install mysql server with libraries
apt-get install -y mysql-server mysql-client libmysqlclient-dev libmysqld-dev python-mysqldb

# Install apache
apt-get install -y apache2 apache2-utils libapache2-mod-php5

# Install requirements for phpbrew
apt-get build-dep php5
apt-get install -y php5 php5-dev php-pear autoconf automake curl libcurl3-openssl-dev build-essential libxslt1-dev re2c libxml2 libxml2-dev php5-cli bison libbz2-dev libreadline-dev
apt-get install -y libfreetype6 libfreetype6-dev libpng12-0 libpng12-dev libjpeg-dev libjpeg8-dev libjpeg8  libgd-dev libgd3 libxpm4 libltdl7 libltdl-dev
apt-get install -y libssl-dev openssl
apt-get install -y gettext libgettextpo-dev libgettextpo0
apt-get install -y libicu-dev
apt-get install -y libmhash-dev libmhash2
apt-get install -y libmcrypt-dev libmcrypt4

# Cleanup obsolete packages.
apt-get autoremove --purge -y -q

# Install nodejs
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs

# Install npm packages
npm install -g grunt-cli
npm install -g bower

# Install rvm / ruby / mailcatcher
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.2
rvm use 2.2 --default
gem install mailcatcher --no-ri --no-rdoc

# Install phpbrew, PHP 5.6 and PHP 7
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
mv phpbrew /usr/local/bin/
export PHPBREW_ROOT=/opt/phpbrew
export PHPBREW_HOME=/opt/phpbrew
phpbrew init
source /opt/phpbrew/bashrc
phpbrew install 5.6 +default+fpm+mysql+gd+soap+opcache
phpbrew install 7.0 +default+fpm+mysql+gd+soap+opcache
echo "export PHPBREW_ROOT=/opt/phpbrew
export PHPBREW_HOME=/opt/phpbrew
[[ -e /opt/phpbrew/bashrc ]] && source /opt/phpbrew/bashrc
" > /etc/profile.d/phpbrew.sh

# After all packages were installed, change the APT mirror to default:
sed -i 's/http:\/\/mirror\.rackspace\.com\/ubuntu/http:\/\/de.archive.ubuntu.com\/ubuntu/g' /etc/apt/sources.list