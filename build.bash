#!/bin/bash
# buildah
#echo "buildah build --compress --no-cache --force-rm -t 'tiddlywiki.js'"
#buildah build --compress --no-cache --force-rm -t 'tiddlywiki.js'

# docker-compose
echo "docker build --compress --force-rm -t 'tiddlywiki.js' ."
docker build --compress --force-rm -t 'tiddlywiki.js' .

