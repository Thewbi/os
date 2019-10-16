#!/bin/bash

# retrieves the largest index of all currently existing loopback devices
function retrieveLargestLoopbackIndex {

	# initialize largest index
	__LARGEST_INDEX=-1;

	# remember what the IFS was
	__IFS_DEFAULT=${IFS};

	# iterating over all lines will split each line by space and then iterate over all those splits
	# instead of just over lines. To iterate over complete lines, change the internal field separator (IFS) to a
	# newline so that the for loop splits the input at a newline character instead of at space
	IFS=$'\n';

	# retrieve all loopback devices
	__ALL_LOOPBACKS="$(sudo losetup -a)";

	# iterate over the list of loopback devices
	for line in ${__ALL_LOOPBACKS}; 
	do 
		# split the line by colon and retrieve the first element
		__FIRST_SPLIT="$(cut -d':' -f1 <<<"$line")";

		# remove the prefix to keep only the index
		__FIRST_SPLIT_INDEX=${__FIRST_SPLIT#"/dev/loop"};

		# find the maximum index, store it into the LARGEST_INDEX variable
		if (( __FIRST_SPLIT_INDEX > __LARGEST_INDEX )); then
	    		__LARGEST_INDEX=${__FIRST_SPLIT_INDEX};
		fi
	done

	# reset the IFS
	IFS=${__IFS_DEFAULT};

	# return the value
	echo ${__LARGEST_INDEX}
}