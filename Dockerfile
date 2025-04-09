FROM couchdb:3.3

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

ENV ERL_FLAGS="-setcookie monster -name couchdb@0.0.0.0"
ENV NODENAME=couchdb@0.0.0.0

EXPOSE 5984

CMD ["couchdb"]