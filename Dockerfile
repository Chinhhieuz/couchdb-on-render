FROM couchdb:3.3.3

# Copy cấu hình CouchDB nếu có
# COPY local.ini /opt/couchdb/etc/local.ini

# Thêm script entrypoint để tạo DB hệ thống
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Tạo thư mục log nếu chưa có
RUN mkdir -p /opt/couchdb/var/log && chown -R couchdb:couchdb /opt/couchdb/var/log

# Expose cổng CouchDB
EXPOSE 5984

# Start script (gọi entrypoint trước rồi chạy couchdb)
CMD ["bash", "/usr/local/bin/entrypoint.sh"]
