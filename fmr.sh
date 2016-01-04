#!/bin/bash

echo "Fetching..."
git fetch $1 2>&1 | sed 's/^/\t/'
echo -e "Done.\n"

echo "Merging forcing fast forward..."
git merge --ff-only $2 2>&1 | sed 's/^/\t/'

if [[ ${PIPESTATUS[0]} != 0 ]]; then
	echo "Fast forward not possible, performing a rebase..."
	git rebase $2 2>&1 | sed 's/^/\t/'

	if [[ ${PIPESTATUS[0]} != 0 ]]; then
		echo -e "An error occured during rebasing. Please fix it by using the instructions above.\n"
	else
		echo -e "Done.\n"
	fi
else
	echo -e "Done.\n"
fi

