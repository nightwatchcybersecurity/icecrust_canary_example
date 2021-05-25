#!/bin/bash
#
# Runs icetrust to verify a single file
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs
icetrust canary $2 "data/input/$1.json" --output-json "data/output/$1.json" --save-file "data/output_data/$1.txt" || true
