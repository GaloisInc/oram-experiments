#!/bin/bash
# builds sqrtOram in a docker container and runs the binary search benchmark once on n items

set -e

n=${1:10000}

docker build -t sqrtoram .
docker run -it sqrtoram bash -c "cd sqrtOram && ./run-benchmark.sh $n"
