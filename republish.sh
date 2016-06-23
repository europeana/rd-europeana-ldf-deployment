#!/bin/bash
# Automatically publishes the datadump /opt/dump.tar.gz in the LDF server

basedir="/opt"

# Prepare new HDT files
./extractdump.sh $basedir
./assemble-fragmented.sh $basedir/dumpnew/dump

# Stop the LDF server
docker-compose stop

# Replace the HDT files
rm -rf $basedir/dump
mv $basedir/dumpnew $basedir/dump/

# Restart the LDF server
docker-compose up -d

