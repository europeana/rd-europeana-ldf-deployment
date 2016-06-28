#!/bin/bash
# Extracts a datadump in $1 to $1/dumpnew
basedir=$1
echo "Extracting tar..."
mkdir $basedir/dumpnew
tar -xvzf $basedir/dump.tar.gz -C $basedir/dumpnew
echo "Unzipping files..."
mv $basedir/dumpnew/dump/dump/*.zip $basedir/dumpnew/dump
ls $basedir/dumpnew/dump/*.zip | awk -F'.zip' '{print "unzip "$0" -d "$1}' | sh
rm $basedir/dumpnew/dump/*.zip
