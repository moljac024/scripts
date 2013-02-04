#!/bin/sh
############################################################################
# A simple script that uses a regex to mine out definitions from JavaScript
# files, dumping them to a tags file that Vim can use to assist with auto-
# completion, quickly navigating to declarations, etc.
# See http://en.wikipedia.org/wiki/Ctags#Ctags for a brief discussion
# on the ctags format. For the current purposes, it is assumed to be
# {tagname}<Tab>{tagfile}<Tab>{tagaddress}
############################################################################

#a temporary file for accumulating tags
F="/tmp/${0}_$$"

#for loops should loop over line breaks, not white space
IFS=$(echo -en "\n\b")

#the target regex to find and dump into the tags file
REGEX='dojo\.[^_].*=[ ]*function'

#loop over all of the javascript files and dump out the tags format
for i in `find . -name "*.js"`; do
    for j in `grep -h $REGEX $i | sed "s/.*\($REGEX\).*/\1/"`; do
        echo "`echo $j | cut -d' ' -f1`	$i	/$j/" >> $F
    done
done

#the tags file must be sorted
cat $F | sort > ./tags

#clean up
rm $F

#some tweaking by hand is necessary because the regex extraction is far from perfect.you have been warned.
echo "You'll need to manually delete duplicates and so some tweaking. Output written to ./tags"
