FROM couchdb:3.3

ENV COUCHDB_USER=admin
ENV COUCHDB_PASSWORD=admin123

COPY local.ini /opt/couchdb/etc/local.ini
EXPOSE 5984