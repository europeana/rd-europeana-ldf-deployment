#!/bin/bash
# Converts a file to HDT
basedir=$1
file=$2
docker run -it --rm -v $basedir:/data rfdhdt/hdt-cpp rdf2hdt -f rdfxml /data/$1 /data/$1.hdt

