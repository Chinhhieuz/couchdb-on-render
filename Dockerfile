FROM couchdb:3.3

COPY local.ini /opt/couchdb/etc/local.ini

COPY vm.args /opt/couchdb/etc/vm.args

CMD ["couchdb", "-setcookie", "monster", "-name", "couchdb@127.0.0.1"]
