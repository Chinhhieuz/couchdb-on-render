FROM couchdb:3.3

# Ghi đè cấu hình CouchDB
COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args

# Cấu hình lại node name và cookie để tránh lỗi "monster"
ENV ERL_FLAGS="-setcookie monster -name couchdb@0.0.0.0"

# Lắng nghe trên tất cả địa chỉ IP
ENV NODENAME=couchdb@0.0.0.0

EXPOSE 5984

CMD ["couchdb"]
