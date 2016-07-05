Scripts for setting up the Europeana LDF server

Note: until the CompositeDatasource feature has been merged to the master branch of the LDF server, the [develop branch](https://github.com/LinkedDataFragments/Server.js/tree/develop) must be used.

## (Re-)Publication
(Re-)publish a dataset from `/opt/dump` by running `republish.sh`.

Start the LDF server and webclient in a daemon by running `docker-compose up -d` (the `BASEDIR` environment variable must refer to the directory in which the `.hdt` files are available).
Run `docker-compose logs -f` to see that server logs.
Start the daemon by running `docker-compose stop`.

## Possible issues
It may be possible that HDT `.index` files become corrupted because queries are being sent to the server while it is still starting.
In this case, all `.hdt.index` must be removed and the server must be restarted. The server will recreate the index files automatically.

## Helper scripts
The following scripts are used by the `republish.sh` script to handle different tasks.

### extractdump.sh
Takes a directory as input argument in which a `dump.tar.gz` must be available.
It will extract the tar and unzip all its containing zip files.

### assemble-fragmented.sh
Takes a directory as input argument in which an extracted data dump must be available.
It will assemble all RDF/XML files per zip file together in one file and create an HDT file from each one.

### create-hdt.sh
Converts a given RDF/XML file to HDT.

### create-config-server.sh
Given a directory that contains HDT files, this script will create a `config-server.json` config file for the LDF server.

## Other files

`config-client.json`: Template config for the LDF web client, which contains datasource links and prefixes.
`config-server-template.json`: Template config for the LDF server, which contains datasource configurations and prefixes.
`docker-compose.yml`: Configurations for setting up and linking the LDF server, cache and web client.
`nginx-default`: Nginx cache config file.
`nginx.conf`: Nginx cache config file.
`queries/`: All europeana queries that will be loaded by the LDF web client.
