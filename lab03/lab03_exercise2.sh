#!/bin/bash
echo "$1" >> test.txt
# for loop to count to 10
for c in {1..5}; do
        echo "Count: $c" >> test.txt

        # if does not use == it uses -eq
        # note the spaces around if [ ]
        if [ $c -eq 3 ]; then
                echo "found the third item" >> test.txt
        fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script


# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
        echo "Non numeric value entered, enter number" >&2 >> test.txt
        date >> test.txt
	echo "--------------" >> test.txt
	exit 1
fi

ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine" >> test.txt

if [ -z $1 ]; then
        echo "You didn't pass any paraemters to $0" >> test.txt
else
        if [ "$ct" -gt "$1" ]; then
                echo "Maximum number of processes exceeded" >> test.txt
        else
                echo "Maximum number of processes NOT exceeded" >> test.txt
        fi
fi

date >> test.txt
echo "--------------" >> test.txt
