#!/bin/bash

LIBEVENT_PACKAGE=$(curl -s https://api.github.com/repos/libevent/libevent/releases/latest | grep -Eo 'https.*stable.tar.gz' | head -n 1)
TMUX_PACKAGE=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -Eo 'https.*.tar.gz' | head -n 1)
LIBEVENT_PACKAGE_DIR=$(echo $LIBEVENT_PACKAGE | awk -F/ '{print $NF}')
TMUX_PACKAGE_DIR=$(echo $TMUX_PACKAGE | awk -F/ '{print $NF}')

function install_yum_dependencies() {
yum install -y ncurses-devel
yum groupinstall -y 'development tools'
}

function install_libevent() {
curl -OL "$LIBEVENT_PACKAGE"
tar -xzf libevent-*.tar.gz
cd $LIBEVENT_PACKAGE_DIR
./configure
make
make install
}

function install_tmux() {
curl -OL "$TMUX_PACKAGE"
tar -xzf tmux-*.tar.gz
cd $TMUX_PACKAGE_DIR
./configure
make
make install
echo export LD_LIBRARY_PATH=/usr/local/lib >> ~/.bash_profile
source ~/.bash_profile
}

function install_rvm-gems-tmuxinator() {
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.1
yum install -y rubygems
gem install tmuxinator
}

install_yum_dependencies
install_libevent
install_tmux
install_rvm-gems-tmuxinator
