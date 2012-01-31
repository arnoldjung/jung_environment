#!/bin/bash

bak() { mv $1 $1.$(date +%F).bak; }

bak ~/.bashrc
bak ~/.vimrc

JUNG_ENV=`pwd`
ln -s $JUNG_ENV/bashrc ~/.bashrc
ln -s $JUNG_ENV/vimrc  ~/.vimrc

