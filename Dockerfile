FROM couchdb:3.3

COPY local.ini /opt/couchdb/etc/local.ini

CMD ["couchdb", "-setcookie", "monster", "-name", "couchdb@127.0.0.1"]


