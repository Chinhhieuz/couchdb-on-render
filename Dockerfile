FROM couchdb:3

# Ghi đè cấu hình
COPY local.ini /opt/couchdb/etc/local.d/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

# Mở port HTTP CouchDB
EXPOSE 5984

# Đặt cookie và tên node
ENV COUCHDB_USER=admin
ENV COUCHDB_PASSWORD=chinhhieu01
ENV NODENAME=couchdb@127.0.0.1
ENV ERL_FLAGS="-setcookie monster"

CMD ["couchdb"]
