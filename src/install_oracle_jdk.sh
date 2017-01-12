#!/bin/bash
# Install Oracle JDK

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
REPO=webupd8team/java # PPA Oracle
JDK_6=oracle-java6-installer # Oracle JDK 6
JDK_7=oracle-java7-installer # Oracle JDK 7
JDK_8=oracle-java8-installer # Oracle JDK 8
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

echo "1.- Installing Packages"
apt-get install python-software-properties -y
# Add if you dont have it!
if ! grep -l "$REPO" /etc/apt/sources.list /etc/apt/sources.list.d/*
then
  add-apt-repository ppa:$REPO -y
fi	

echo "2.- Updating"
apt-get update

echo "3.- Installing Java"
echo "Select your favorite version, followed by [ENTER]:"
echo "1) Oracle JDK 6"
echo "2) Oracle JDK 7"
echo "3) Oracle JDK 8"
echo "Type something else to cancelled"
echo -n "> "

read VERSION

if [ $VERSION == 1 ]
then
  apt-get install $JDK_6 -y
elif [ $VERSION == 2 ]
then
  apt-get install $JDK_7 -y
elif [ $VERSION == 3 ]
then
  apt-get install $JDK_8 -y
else
  echo "Cancelled By User"
  exit 1
fi

echo "#################"
echo "JAVA INSTALLED!"
echo "#################"
exit 0