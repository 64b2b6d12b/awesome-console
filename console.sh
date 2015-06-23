#!/bin/bash

#This bash script will do the following on a CentOS 6.x box - other distros/versions have not been tested:
# - Compile tmux from source (including installing ncurses and compiling libevent from source)
# - Install RVM (Ruby Version Manager)
# - Install Ruby Gems
# - Install tmuxinator

## Run this script as root so that passwords are not needed

## Lets intstall libevent

yum -y install ncurses-devel

## You will need to check https://github.com/libevent/libevent/releases/latest for the latest URL and change the script appropriately

curl -O https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz

tar -xvzf libevent-*.tar.gz
cd libevent*
## Try the script first without " ./configure --prefix=/usr/local "
make && make install

## Lets sleep for 5 seconds to let things settle
sleep 5

## Time to compile tmux - You will need to check https://github.com/tmux/tmux/releases for the latest URL and change the script appropriately

curl -L https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz

tar -xvzf tmux-*.tar.gz
cd tmux-*
## Try the script first without " LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local "
make && make install

echo export LD_LIBRARY_PATH=/usr/local/lib >> ~/.bash_profile
. ~/.bash_profile

## Time to install tmuxinator via gem

## First, lets install RVM so that we can install Ruby and Ruby Gems

yum groupinstall -y 'development tools'

curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.1
yum install rubygems

## Finally, let's install tmuxinator

gem install tmuxinator

## Lets sleep for 5 seconds to let things settle
sleep 5

echo "Phase 1 is complete"
