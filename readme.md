oram-experiments
================

This repo contains a mechanism to build Square-Root ORAM optimized for Garbled Circuits
([implementation](https://github.com/samee/sqrtOram))
([paper](https://www.cs.umd.edu/~jkatz/papers/sqoram.pdf)).  We use Docker because
`sqrtOram` (and `Obliv-C`, which it depends on) hasn't been updated in a while, and relies
on older tools such as `glibc`.

To run the binary search benchmark they reported in the paper
([search.c](https://github.com/samee/sqrtOram/blob/master/bench/search.c)), simply run
```
    ./run.sh NUM
``` 
where `NUM` is the size of the ORAM instance you'd like to benchmark. 

Docker is the only dependency, and your user must have privileges to use it.
