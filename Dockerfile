FROM apache/couchdb:3.3

# Thiết lập biến môi trường
ENV COUCHDB_USER=admin \
    COUCHDB_PASSWORD=chinhhieu01 \
    NODENAME=couchdb@127.0.0.1 \
    ERL_FLAGS="-setcookie couchdbcluster -name couchdb@127.0.0.1"

# Sao chép file cấu hình vào container
COPY local.ini /opt/couchdb/etc/local.ini
COPY vm.args /opt/couchdb/etc/vm.args
COPY entrypoint.sh /entrypoint.sh

# Cấp quyền thực thi cho entrypoint
RUN chmod +x /entrypoint.sh

# Mở cổng CouchDB
EXPOSE 5984

# Khởi chạy entrypoint script
CMD ["/entrypoint.sh"]
