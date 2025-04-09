FROM apache/couchdb:3.3

ENV COUCHDB_USER=admin \
    COUCHDB_PASSWORD=chinhhieu01 \
    NODENAME=couchdb@127.0.0.1

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

EXPOSE 5984

CMD ["sh", "-c", "/opt/couchdb/bin/couchdb & sleep 5 && \
  curl -X PUT http://admin:chinhhieu01@127.0.0.1:5984/_users && \
  curl -X PUT http://admin:chinhhieu01@127.0.0.1:5984/_replicator && \
  tail -f /dev/null"]
