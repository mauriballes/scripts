#!/bin/bash
# Create Swap File

RE='^[0-9]+$'
SWAP="/swapfile none swap sw 0 0"
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi

if [ grep -l "$SWAP" /etc/fstab ]
then
  echo "You already create a swap file with this script!"
  exit 3
fi

echo "1.- Select size for SWAP [1-4]"
echo -n "> "
read SWAP_SIZE

if  ! [[ $SWAP_SIZE =~ $RE ]]
then
  echo "Is not a valid number!"
  exit 2
fi

if [ "$SWAP_SIZE" -lt 1 ] || [ "$SWAP_SIZE" -gt 4 ]
then
  echo "Size Not Recommended!"
  exit 1
fi

echo "2.- Creating SWAP!"
fallocate -l "$SWAP_SIZE"G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'

echo "################"
echo "SWAP File Created!"
echo "################"
exit 0
