#!/bin/bash

MOD_DIR=$1
SRC_DIR=$2
PATCH_DIR=$3

MOD_PATTERN=$(echo $MOD_DIR | sed 's/\//\\\//g' -)

for modFile in $(find $MOD_DIR -type f); do
    fileBase=$(echo $modFile | sed s/^$MOD_PATTERN//g -)
    origFile=$SRC_DIR/$fileBase
    patchFile=$PATCH_DIR/$(echo $fileBase | sed 's/\.java$/.patch/g' -)
    mkdir -p $(dirname $patchFile)
    newDiff=$(diff $origFile $modFile)
    if [ -f "$patchFile" ]; then
        oldDiff=$(cat $patchFile)
        if [ "$newDiff" != "$oldDiff" ]; then
            echo "re-patching $modFile"
            echo "$newDiff" > $patchFile
        fi
    else
        echo "patching $modFile"
        echo "$newDiff" > $patchFile
    fi
done