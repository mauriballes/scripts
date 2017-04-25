#!/bin/bash
# Fibonacci

echo "Welcome to my Fibonacci Script"
echo -n "Type your number: "
read NUMBER

if [[ "$NUMBER" -le 0 ]]; then
	echo "Your number has to be greater than 0"
	exit 0
fi

echo 0

if [[ "$NUMBER" -eq 1 ]]; then
	exit 0
fi

echo 1

if [[ "$NUMBER" -eq 2 ]]; then	
	exit 0
fi

BACK=0
ACTUAL=1
AUX=0

while [[ "$NUMBER" -gt 2 ]]; do
	AUX=$ACTUAL
	ACTUAL=$((ACTUAL + BACK))
	BACK=$AUX
	echo "$ACTUAL"
	NUMBER=$((NUMBER - 1))
done

exit 0