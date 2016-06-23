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

# Recreate server config file
./create-config-server.sh $basedir/dump/dump/ > config-server.json

# Restart the LDF server
export BASEDIR=$basedir/dump/dump
docker-compose up -d

