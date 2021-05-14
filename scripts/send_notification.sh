#!/bin/bash
#
# Check changes to see if notifications need to be sent out
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs

GIT_PAGER=cat

for output_file in data/output/*.json
do
	filename=`echo $output_file | sed -e 's/data\/output\///g' | sed -e 's/\.json//g'`
	echo ---- Processing "$filename.json" ----
	verified_count=`git --no-pager diff --unified=0 "data/output/$filename.json" | grep \"verified\" | wc -l`
	previous_count=`git --no-pager diff --unified=0 "data/output/$filename.json" | grep \"previous_version_matched\" | wc -l`

	echo Verified count: $verified_count, Previous count: $previous_count
	if [[ $(($verified_count)) == 2 ]]
	then
    verified_result=`grep \"verified\" "data/output/$filename.json"`
    if [[ $verified_result == *"true"* ]]
    then
  	  echo "$filename: verification passed"
      curl -X POST "https://maker.ifttt.com/trigger/test/with/key/$IFTTT_KEY?value1=$filename:%20verification%20failed"
    else
  	  echo "$filename: verification failed"
      curl -X POST "https://maker.ifttt.com/trigger/test/with/key/$IFTTT_KEY?value1=$filename:%20verification%20failed"
    fi
 	fi

	if [[ $(($previous_count)) == 2 ]]
	then
    previous_result=`grep \"previous_version_matched\" "data/output/$filename.json"`
    if [[ $previous_result == *"false"* ]]
    then
      echo "$filename: file content has changed"
      curl -X POST "https://maker.ifttt.com/trigger/test/with/key/$IFTTT_KEY?value1=:%20file%20content%20has%20changed"
    fi
	fi

	echo
	#break
done