# Dockerfile to build tiddlywiki.js
FROM node:alpine
LABEL PCFreak pcfreak
COPY ./start.sh /bin/start.sh
WORKDIR /opt/tiddlywiki
RUN apk update && apk add jq && npm install tiddlywiki && \
    mkdir -p /init && cd /init && chmod +x /bin/start.sh && \
    /opt/tiddlywiki/node_modules/.bin/tiddlywiki --init server
EXPOSE 8115
CMD ["/bin/start.sh"]
