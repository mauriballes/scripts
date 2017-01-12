#!/bin/bash
# Create a New User

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

echo -n "Write your username: "
read USERNAME

adduser $USERNAME

echo -n "Do you want to give superuser privileges? [Y/n] "
read RES

if [[ "$RES" == "y" || "$RES" == "Y" ]]
then
  gpasswd -a $USERNAME sudo
fi

echo "#################"
echo "User Created!"
echo "#################"
exit 0
