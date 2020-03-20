#!/bin/bash

set -xe

./search bench :12345 --oramtype=sqrt -z500 -c100 &
./search bench localhost:12345 --oramtype=sqrt -z500 -c100
