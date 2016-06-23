#!/bin/bash
# Converts a file to HDT
basedir=$1
file=$2
docker run -it --rm -v $basedir:/data rfdhdt/hdt-cpp rdf2hdt -f rdfxml /data/$file /data/$file.hdt
rm $basedir/$file

