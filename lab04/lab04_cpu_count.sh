#!/bin/bash

num_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

if [ $num_cpu -lt "$1" ]; then
	echo "fail"
else
	echo "success"
fi
