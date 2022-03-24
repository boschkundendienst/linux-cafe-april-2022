#!/bin/bash
tiddlyroot='/webroot/.'
template='$:/core/save/all'
outputfile="index.html"
format='text/plain'
servicename='tiddlywiki'
tiddlybin='/opt/tiddlywiki/node_modules/.bin/tiddlywiki'
mydate="$(date +'%Y-%m-%d-%H%M%S')"
localoutputfile="./webroot/output/${outputfile}"
targetfile="./${mydate}-index.html"

#podman exec tiddlywiki /opt/tiddlywiki/node_modules/.bin/tiddlywiki /webroot/. --render $:/core/save/all index.html text/plain
#podman exec "$servicename" "$tiddlybin" "$tiddlyroot" --render "$template" "$outputfile" "$format"
docker exec "$servicename" "$tiddlybin" "$tiddlyroot" --render "$template" "$outputfile" "$format"
mv "$localoutputfile" "$targetfile"
#/opt/tiddlywiki/node_modules/.bin/tiddlywiki . --render $:/core/save/all index.html text/plain
