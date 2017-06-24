#!/bin/bash
# Install Oracle JDK

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
REPO=ondrej/php # PPA PHP
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

echo "Installing Packages"
apt-get install software-properties-common -y
# Add if you dont have it!
if ! grep -l "$REPO" /etc/apt/sources.list /etc/apt/sources.list.d/*
then
  add-apt-repository ppa:$REPO -y
fi

echo "Installing PHP7"
apt-get install php7.0 \
php7.0-cli \
php7.0-common \
php7.0-curl \
php7.0-dev \
php7.0-fpm \
php7.0-gd \
php7.0-json \
php7.0-mbstring \
php7.0-mcrypt \
php7.0-mysql \
php7.0-pgsql \
php7.0-sqlite3 \
php7.0-opcache \
php7.0-readline \
php7.0-xml \
php7.0-zip -y
echo "#################"
echo "Packages Installed!"
echo "#################"

exit 0
