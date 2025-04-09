FROM couchdb:3.3

# Sao chép file config custom vào đúng thư mục
COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

# Expose cổng CouchDB
EXPOSE 5984

# Biến môi trường khởi động
ENV COUCHDB_USER=admin
ENV COUCHDB_PASSWORD=admin
ENV NODENAME=couchdb@127.0.0.1
ENV ERL_FLAGS="-setcookie monster -name couchdb@127.0.0.1"

# Lệnh khởi động CouchDB
CMD ["couchdb"]
