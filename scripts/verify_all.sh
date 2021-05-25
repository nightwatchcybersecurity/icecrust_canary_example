#!/bin/bash
#
# Runs icetrust to verify all files listed in the docs/data directory
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs

for input_file in data/input/*.json
do
	filename=`echo $input_file | sed -e 's/data\/input\///g' | sed -e 's/\.json//g'`
	echo ---- Processing "$filename.json" ----
	$SCRIPT_DIR/verify_one.sh "$filename" "$1"
	echo
	#break
done