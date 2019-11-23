#!/bin/bash

MOD_DIR=$1
SRC_DIR=$2
PATCH_DIR=$3

PATCH_PATTERN=$(echo $PATCH_DIR | sed 's/\//\\\//g' -)

for patch in $(find $PATCH_DIR -type f); do
    fileBase=$(echo $patch | sed s/^$PATCH_PATTERN//g - | sed s/\.patch/\.java/g -)
    origFile=$SRC_DIR/$fileBase
    modFile=$MOD_DIR/$fileBase
    mkdir -p $(dirname $modFile)
    cp $origFile $modFile
    patch $modFile < $patch
done