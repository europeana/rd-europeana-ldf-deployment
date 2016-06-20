#!/bin/bash
# Converts a file to HDT
#file="dataset-test.nt.gz"
file=$1
docker run -it --rm -v $(pwd)/data:/data rfdhdt/hdt-cpp rdf2hdt -f ntriples /data/$file /data/dataset.hdt

