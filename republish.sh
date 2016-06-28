#!/bin/bash
# Automatically publishes the datadump /opt/dump.tar.gz in the LDF server

#echo "EDIT THIS FILE IF YOU WANT TO RUN THIS!!!" # TODO
#exit 1; # TODO

basedir="/opt/old_dumps"

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

# Clean cache
rm -rf tmp-cache
rm -rf tmp-nginx

# Restart the LDF server
export BASEDIR=$basedir/dump/dump
docker-compose up -d

