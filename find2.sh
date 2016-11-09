#!/bin/bash

[ -z $2 ] && pattern="*" || pattern="$2"

accent='\033[1;33m'
normal='\033[0m'

echo -e "Searching for ${accent}\"$1\"${normal} in current directory matching files ${accent}\"$pattern\"${normal}"
find . -type f -name "$pattern" -print0 | xargs -I {} -0 grep -H "$1" "{}"


