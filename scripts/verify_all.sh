#!/bin/bash
#
# Runs icetrust to verify all files listed in the docs/data directory
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs

for input_file in data/input/*.json
do
	filename=`echo $input_file | sed -e 's/data\/input\///g' | sed -e 's/\.json//g'`
	echo ---- Processing $input_file ----
	icetrust canary $1 "data/input/$filename.json" --output-json "data/output/$filename.json" --save-file "data/output_data/$filename.txt" || true
	echo
	#break
done