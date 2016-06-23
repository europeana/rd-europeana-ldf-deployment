#!/bin/bash
# Create an LDF server config file that composes $1 HDT files

basedir="/data/"
idprefix="europeana-"
absolutedir=$1
amount=$(ls -1 $absolutedir | grep .hdt | wc -l)
comma=","

references=""
datasources=""

i=1
for absolutefile in $absolutedir*.hdt; do
    id="$idprefix$i"
    file="$basedir$(basename $absolutefile)"

    if [ $i -eq $amount ]; then
        comma=""
    fi
    references="$references\"$id\"$comma"
    datasource="\"$id\": { \"hide\": \"true\", \"title\": \"$id\", \"type\": \"HdtDatasource\", \"settings\": { \"file\": \"$file\" } }"
    datasources="$datasources$datasource,"
    let i++
done

sed -e "s/__REFERENCES__/$references/" -e "s@__DATASOURCES__@$datasources@" config-server-template.json
