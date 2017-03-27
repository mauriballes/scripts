#!/bin/bash
# Fibonacci

echo "Welcome to my Fibonacci Script"
echo -n "Type your number: "
read NUMBER

if [[ "$NUMBER" -lt 0 || "$NUMBER" -eq 0 ]]; then
	echo "Your number has to be greater than 0"
	exit 0
fi

if [[ "$NUMBER" -eq 1 ]]; then
	echo 0
	exit 0
fi

if [[ "$NUMBER" -eq 2 ]]; then
	echo 0
	echo 1
	exit 0
fi

BACK=0
ACTUAL=1
AUX=0

echo "$BACK"
echo "$ACTUAL"

while [[ "$NUMBER" -gt 2 ]]; do
	AUX=$ACTUAL
	ACTUAL=$((ACTUAL + BACK))
	BACK=$AUX
	echo "$ACTUAL"
	NUMBER=$((NUMBER - 1))
done

exit 0