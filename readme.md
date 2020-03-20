oram-experiments
================

This repo contains a mechanism to build Square-Root ORAM optimized for Garbled Circuits
([implementation](https://github.com/samee/sqrtOram))
([paper](https://www.cs.umd.edu/~jkatz/papers/sqoram.pdf)).  We use Docker because
`sqrtOram` (and `Obliv-C`, which it depends on) hasn't been updated in a while, and relies
on older tools such as `glibc`.
Obliv-C is an MPC engine, and sqrtOram is an implementation of ORAM inside it. The Obliv-C
documentation is available [here](https://oblivc.org/documentation/).

To run the binary search using square root ORAM in MPC benchmark they reported in the
paper ([search.c](https://github.com/samee/sqrtOram/blob/master/bench/search.c)), simply
run
```
    ./run.sh NUM
``` 
where `NUM` is the size of the ORAM instance you'd like to benchmark. 

Docker is the only dependency ([intro to docker
here](https://docs.docker.com/get-started/)), and your user must have privileges to use
it.

example output
--------------

```
Sending build context to Docker daemon  105.5kB
Step 1/14 : FROM fedora:24
...
[docker build output]
...
running Square Root ORAM binary search benchmark in Obliv-C with n=10000
	Command being timed: "./search bench localhost:12345 --oramtype=sqrt -z10000 -c1"
	User time (seconds): 1.35
	System time (seconds): 0.10
	Percent of CPU this job got: 72%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:02.00
	Average shared text size (kbytes): 0
	Average unshared data size (kbytes): 0
	Average stack size (kbytes): 0
	Average total size (kbytes): 0
	Maximum resident set size (kbytes): 27832
	Average resident set size (kbytes): 0
	Major (requiring I/O) page faults: 0
	Minor (reclaiming a frame) page faults: 7446
	Voluntary context switches: 28469
	Involuntary context switches: 10
	Swaps: 0
	File system inputs: 0
	File system outputs: 0
	Socket messages sent: 0
	Socket messages received: 0
	Signals delivered: 0
	Page size (bytes): 4096
	Exit status: 0
```
