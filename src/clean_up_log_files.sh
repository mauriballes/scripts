#!/bin/bash
# Clean Up Logs

LOG_DIR=/var/log
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=87   # Non-root exit error.
# Variables are better than hard-coded values.

# Run as root, of course.
if [ $UID != $ROOT_UID ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp

echo "################"
echo "Logs cleaned up!"
echo "################"
exit 0
