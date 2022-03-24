#!/bin/sh
test ! -e "/init/is_initalized" && mkdir -p /webroot

# if not yet initialized
test ! -e "/init/is_initalized" && cp -R /init/* /webroot
# manipulate tiddlywiki.info to add plugins and/or languages
test ! -e "/init/is_initalized" && cat /init/tiddlywiki.info | jq '.plugins |= . + ["tiddlywiki/markdown"] | . + {"languages": [ "de-DE","de-AT" ]}' > /webroot/tiddlywiki.info
# mark tiddlywiki as initialized
test ! -e "/init/is_initalized" && touch '/init/is_initalized'

# run Tiddlywiki
RUN_WIKI_OPTS='--listen host=0.0.0.0 port=8115'
[ ! "${WIKI_OPTS}x" == "x" ] && RUN_WIKI_OPTS="${WIKI_OPTS}"
echo "$WIKI_OPTS"
/opt/tiddlywiki/node_modules/.bin/tiddlywiki /webroot $RUN_WIKI_OPTS
