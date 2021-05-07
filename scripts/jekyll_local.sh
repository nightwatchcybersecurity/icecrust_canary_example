#!/bin/bash
#
# Used to start Jekyll locally
#

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $SCRIPT_DIR/../docs
bundle exec jekyll serve --livereload