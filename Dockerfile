FROM couchdb:3.3

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

ENV NODENAME=couchdb@127.0.0.1

EXPOSE 5984

CMD ["couchdb"]
