#!/bin/bash
# Config Tiny Statoc Files Server

cd ~

echo "1.- Installing Libraries"
sudo apt-get install python-dev

echo "2.- Config .bashrc file"
echo "alias tinyserver='python -m SimpleHTTPServer 8000'" >> ~/.bashrc
source ~/.bashrc

echo "Now you can tap 'tinyserver' to initialize the static server!"

echo "################"
echo "Config Complete!"
echo "################"
exit 0
