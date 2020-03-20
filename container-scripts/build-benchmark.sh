#!/bin/bash

set -ex

# build sqrtOram stuff without having to debug their Makefile

OBLIVCC=/obliv-c/bin/oblivcc
BUILD_CMD="$OBLIVCC -Ioram -Iutil -Lbuild -loram -lm util/util.c util/oqueue.oc "

$BUILD_CMD test/test_oqueue.oc test/test_oqueue.c -o test_oqueue
$BUILD_CMD test/testcopy.oc test/testcopy.c -o testcopy
$BUILD_CMD test/testOramAccess.oc test/testOramAccess.c -o testOramAccess
$BUILD_CMD test/testshuffle.oc test/testshuffle.c -o testshuffle
$BUILD_CMD test/testsort.c -o testsort
$BUILD_CMD test/testunapply.oc test/testunapply.c -o testunapply

$BUILD_CMD bench/benchSqrtAccess.oc bench/benchSqrtAccess.c -o benchSqrtAccess
$BUILD_CMD bench/search.oc bench/search.c -o search
$BUILD_CMD bench/timecopy.oc bench/timecopy.c -o timecopy
