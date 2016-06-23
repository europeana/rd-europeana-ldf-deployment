#!/bin/bash
# Create an LDF server config file that composes $1 HDT files

basedir="/data/"
idprefix="europeana-"
filesuffix=".rdf.hdt"
amount=$1
comma=","

referencesindent="                "
datasourcesindent="      "

references=""
datasources=""

for i in $(seq 1 $amount); do
    id="$idprefix$i"
    file="$basedir$i$filesuffix"

    if [ $i -eq $amount ]; then
        comma=""
    fi
    references="$references$referencesindent\"$id\"$comma\\n"
    datasource="\"$id\": { \"hide\": \"true\", \"title\": \"$id\", \"type\": \"HdtDatasource\", \"settings\": { \"file\": \"$file\" } }"
    datasources="$datasources$datasourcesindent$datasource,\\n"
done

sed -e "s/__REFERENCES__/$references/" -e "s@__DATASOURCES__@$datasources@" config-server-template.json
