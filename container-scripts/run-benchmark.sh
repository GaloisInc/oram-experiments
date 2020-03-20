#!/bin/bash

set -e

n=${1:-10000}

echo running Square Root ORAM binary search benchmark in Obliv-C with n=$n

./search bench :12345 --oramtype=sqrt -z$n -c1 &
/usr/bin/time -v ./search bench localhost:12345 --oramtype=sqrt -z$n -c1
