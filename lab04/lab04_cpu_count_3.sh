#!/bin/bash

num_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

echo "Compare num to Number of processes or number of CPU cores"

#!/bin/bash

PS3="Select the operation (Enter number): "

select opt in cpu process quit ; do

  case $opt in
    cpu)
      if [ $num_cpu -lt "$1" ]; then
	        echo "Fail"        
	else
        	echo "Success"
	fi


	if [ -z "$1"  ]; then
        	echo "Usage: $0 [MAX_NUM_CORES]"
	fi
      ;;
    process)
      # Count running processes.
	ct=$(ps -ef | wc -l)
	#ct=$(( $(ps -ef | wc -l) - 1 )) 	#Alternative command, if you want to remove the ps header from the count and be more accurate.

	# Compare the actual count against the supplied maximum.
	# Common error: Reversed comparisons or incorrect equality handling.
	if [ "$ct" -gt "$1" ]; then
    		echo "Maximum number of processes exceeded"
	else
    		echo "The maximum number of processes NOT exceeded"
	fi
      ;;
    quit)
      break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done

# Takes in a number to compare to either number of processes or number of CPU cores
# Used for reference :https://linuxize.com/post/bash-select/
