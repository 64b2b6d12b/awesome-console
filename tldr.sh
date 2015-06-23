#!/bin/bash

yum install -y ncurses-devel
yum groupinstall -y 'development tools'
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -OL https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
tar -xzf libevent-*.tar.gz
cd libevent*
./configure
make
make install

curl -OL https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
tar -xzf tmux-*.tar.gz
cd tmux-*
./configure
make
make install
echo export LD_LIBRARY_PATH=/usr/local/lib >> ~/.bash_profile
. ~/.bash_profile

curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.1
yum install -y rubygems
gem install tmuxinator
