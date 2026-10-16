#!/bin/bash
# this is a comment
# Source - https://stackoverflow.com/a/1885534
# Posted by Dennis Williamson, modified by community. See post 'Timeline' for change history
# Retrieved 2026-10-02, License - CC BY-SA 4.0

read -p "Write to file or screen (f or s)" -n 1 -r
echo 
if [[ $REPLY =~ ^[Ff]$ ]]; then
	echo "$1" >> test2.txt
	# for loop to count to 10
	for c in {1..5}; do
        	echo "Count: $c" >> test2.txt

        	# if does not use == it uses -eq
        	# note the spaces around if [ ]
        	if [ $c -eq 3 ]; then
                	echo "found the third item" >> test2.txt
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
        	echo "Non numeric value entered, enter number" >&2 >> test2.txt
        	date >> test2.txt
        	echo "--------------------" >> test2.txt
		exit 1
	fi

	ct=$(ps -ef | wc -l)
	echo "There are $ct processes running on this machine" >> test2.txt

	if [ -z $1 ]; then
        	echo "You didn't pass any paraemters to $0" >> test2.txt
	else
        	if [ "$ct" -gt "$1" ]; then
                	echo "Maximum number of processes exceeded" >> test2.txt
        	else
                	echo "Maximum number of processes NOT exceeded" >> test2.txt
        	fi
	fi
	date >> test2.txt
        echo "--------------------" >> test2.txt
elif [[ $REPLY =~ ^[Ss]$ ]]; then
	# for loop to count to 10
        for c in {1..5}; do
                echo "Count: $c"

                # if does not use == it uses -eq
                # note the spaces around if [ ]
                if [ $c -eq 3 ]; then
                        echo "found the third item"
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
                echo "Non numeric value entered, enter number" >&2
                exit 1
        fi

	ct=$(ps -ef | wc -l)
        echo "There are $ct processes running on this machine"

        if [ -z $1 ]; then
                echo "You didn't pass any paraemters to $0"
        else
                if [ $1 -lt $ct ]; then
                        echo "The maximum number of processes NOT exceeded"
                        echo "You passed in $1 to $0" 
                else
                        echo "Maximum number of processes exceeded" 
                fi
        fi
fi
