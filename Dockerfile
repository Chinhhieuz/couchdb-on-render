FROM apache/couchdb:3.3

ENV COUCHDB_USER=admin \
    COUCHDB_PASSWORD=chinhhieu01 \
    NODENAME=couchdb@127.0.0.1

COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 5984

CMD ["sh", "/entrypoint.sh"]
