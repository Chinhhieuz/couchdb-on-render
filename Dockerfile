FROM couchdb:3
FROM couchdb:3

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

ENV NODENAME=couchdb@127.0.0.1
ENV ERL_FLAGS="-setcookie monster -name couchdb@127.0.0.1"

EXPOSE 5984

CMD ["couchdb"]
CMD ["sh", "-c", "couchdb & sleep 5 && curl -X PUT http://admin:chinhhieu01@localhost:5984/_users && curl -X PUT http://admin:chinhhieu01@localhost:5984/_replicator && tail -f /dev/null"]
