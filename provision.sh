#!/bin/bash

###############################################################################

locale-gen en_US.UTF-8
dpkg-reconfigure locales

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

###############################################################################

sudo service puppet stop
sudo service chef-client stop

sudo update-rc.d puppet disable
sudo update-rc.d chef-client disable

###############################################################################

sudo apt-get update

###############################################################################

sudo apt-get install -y \
    build-essential \
    libpcre3-dev \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev

###############################################################################

sudo apt-get install -y git

###############################################################################

sudo apt-get install -y nginx

###############################################################################

PGUSER=vagrant
PGPASSWORD=vagrant

sudo apt-get install -y postgresql-9.3

sudo -u postgres psql --command "CREATE USER $PGUSER WITH LOGIN SUPERUSER PASSWORD '$PGPASSWORD'"
sudo -u postgres psql --command "CREATE DATABASE $PGUSER WITH OWNER $PGUSER"

sudo cp -rvf /vagrant/res/z_etc_postgresql/* /etc/
sudo service postgresql restart

###############################################################################

sudo apt-get install -y rabbitmq-server

###############################################################################

wget http://nodejs.org/dist/v0.10.32/node-v0.10.32.tar.gz
tar -zxvf node-*.tar.gz
cd node-*
    ./configure
    make
    sudo make install
cd ..
rm -rfv node-*

###############################################################################

wget http://download.zeromq.org/zeromq-4.0.4.tar.gz
tar -zxvf zeromq-*.tar.gz
cd zeromq-*
    ./configure
    make
    sudo make install
cd ..
rm -rfv zeromq-*

###############################################################################

sudo apt-get install -y python2.7 python3.4 \
    python-setuptools python3-setuptools
sudo easy_install-3.4 pip
sudo easy_install-2.7 pip
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper

###############################################################################

sudo -u vagrant cp -v /vagrant/res/bashrc .bashrc
sudo -u vagrant cp -v /vagrant/res/vimrc .vimrc

###############################################################################

echo -n "" > .bash_history
history -c
