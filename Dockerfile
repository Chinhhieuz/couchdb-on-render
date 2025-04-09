FROM couchdb:3

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

EXPOSE 5984

ENV NODENAME=couchdb@127.0.0.1

CMD ["couchdb"]
