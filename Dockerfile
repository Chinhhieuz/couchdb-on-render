FROM couchdb:latest

COPY local.ini /opt/couchdb/etc/local.ini

EXPOSE 5984

CMD ["couchdb"]
