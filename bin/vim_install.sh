#!/bin/bash
# configure mercurial proxy
#To setup Mercurial to use a proxy server, edit your hrgc file in the .hg folder of your repository and add this section:
#
#[http_proxy]
#host = foo.bar:8000
#passwd = password
#user = username

hg clone  https://vim.googlecode.com/hg/vim
cd vim/src
./configure --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --with-features=huge --prefix=/opt/tools/vim
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s /opt/tools/vim/bin/vim
which vim
vim --version
