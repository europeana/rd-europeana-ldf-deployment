#!/bin/bash
# Loops over all directories in $1 expecting them to contain RDF/XML files.
# For each folder, one assembled RDF/XML file is created which are then converted to HDT.
cdir=$(pwd)
basedir=$1
#basedir="/opt/dump/dump/"

for dir in $basedir/*; do
    # Collect all files into one big RDF/XML file
    target="$dir.rdf"
    echo '<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:edm="http://www.europeana.eu/schemas/edm/"  xml:base="http://unknown-base/">' > $target
    if [[ -d "$dir" ]]; then
        echo $dir
        for file in $dir/*; do
            sed -e "1,1d" -e '$d' $file >> $target
        done
        #rm -rf $dir
    fi
    echo '</rdf:RDF>' >> $target

    # Convert the assembled into HDT
    ./create-hdt.sh $basedir $(basename $target)
done

