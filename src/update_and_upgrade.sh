#!/bin/bash
# Update & Upgrade

ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

apt-get update
apt-get upgrade -y

echo "#################"
echo "Packages Updated!"
echo "#################"
exit 0
