#!/bin/bash

JUNG_ENV='~/.arnold/jung_environment/'
bak() { mv $1 $1.$(date +%F).bak; }

# vim init
bak ~/.vimrc
ln -s $JUNG_ENV/vimrc  ~/.vimrc
mkdir ~/.vimbak

