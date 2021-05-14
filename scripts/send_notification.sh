#!/bin/bash
#
# Check changes to see if notifications need to be sent out
#

# Define variables
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs
GIT_PAGER=cat

# Setup twitter auth
echo $TWITTER_AUTH1 >  ~/.twitter_oauth
echo $TWITTER_AUTH2 >> ~/.twitter_oauth

# Process
for output_file in data/output/*.json
do
	filename=`echo $output_file | sed -e 's/data\/output\///g' | sed -e 's/\.json//g'`
  now=`date +"%Y-%m-%d %H:%M:%S %z"`

	echo ---- Processing "$filename.json" ----
	verified_count=`git --no-pager diff --unified=0 "data/output/$filename.json" | grep \"verified\" | wc -l`
	previous_count=`git --no-pager diff --unified=0 "data/output/$filename.json" | grep \"previous_version_matched\" | wc -l`

	echo Verified count: $verified_count, Previous count: $previous_count
	if [[ $(($verified_count)) == 2 ]]
	then
    verified_result=`grep \"verified\" "data/output/$filename.json"`
    if [[ $verified_result == *"true"* ]]
    then
  	  echo "$filename: verification passed ($now)"
      twitter set "$filename: verification passed ($now)"
    else
  	  echo "$filename: verification failed"
  	  twitter set "$filename: verification failed ($now)"
    fi
 	fi

	if [[ $(($previous_count)) == 2 ]]
	then
    previous_result=`grep \"previous_version_matched\" "data/output/$filename.json"`
    if [[ $previous_result == *"false"* ]]
    then
      echo "$filename: file content has changed ($now)"
      twitter set "$filename: file content has changed ($now)"
    fi
	fi

	echo
	#break
done

# Cleanup
rm ~/.twitter_oauth