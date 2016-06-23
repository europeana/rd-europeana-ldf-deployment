#!/bin/bash
# Extracts a datadump in $1 to $1/dumpnew
basedir=$1
echo "Extracting tar..."
tar -xvzf $basedir/dump.tar.gz -C dumpnew
echo "Unzipping files..."
ls $basedir/dumpnew/dump/*.zip | awk -F'.zip' '{print "unzip "$0" -d "$1}' | sh
