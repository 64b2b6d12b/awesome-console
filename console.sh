#!/bin/bash

LIBEVENT_URL=$(curl -s https://api.github.com/repos/libevent/libevent/releases/latest | grep -Eo 'https.*stable.tar.gz' | head -n 1)
TMUX_URL=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -Eo 'https.*.tar.gz' | head -n 1)
LIBEVENT_TAR=$(echo $LIBEVENT_URL | awk -F/ '{print $NF}')
TMUX_TAR=$(echo $TMUX_URL | awk -F/ '{print $NF}')
LIBEVENT_DIR=$(echo ${LIBEVENT_TAR%.tar.gz})
TMUX_DIR=$(echo ${TMUX_TAR%.tar.gz})

function install_yum_dependencies() {
yum install -y ncurses-devel
yum groupinstall -y 'development tools'
}

function install_libevent() {
curl -OL "$LIBEVENT_URL"
tar -xzf "$LIBEVENT_TAR"
cd "$LIBEVENT_DIR"
./configure
make
make install
}

function install_tmux() {
curl -OL "$TMUX_URL"
tar -xzf "$TMUX_TAR"
cd "$TMUX_DIR"
./configure
make
make install
echo export LD_LIBRARY_PATH=/usr/local/lib >> ~/.bash_profile
source ~/.bash_profile
}

function install_ruby_tmuxinator() {
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
install_ruby_tmuxinator
