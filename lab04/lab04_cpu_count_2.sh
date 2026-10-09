#!/bin/bash

num_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

if [ $num_cpu -lt "$1" ]; then
	echo "Fail"
else
	echo "Success"
fi


if [ -z "$1"  ]; then
	echo "Usage: $0 [MAX_NUM_CORES]"
fi
