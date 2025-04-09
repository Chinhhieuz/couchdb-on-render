#!/bin/bash

# Khởi động CouchDB nền
/opt/couchdb/bin/couchdb &

# Đợi CouchDB sẵn sàng
echo "⏳ Waiting for CouchDB to start..."
until curl -s http://127.0.0.1:5984 >/dev/null; do
  sleep 1
done

# Tạo system DB nếu chưa có
echo "⚙️ Creating system databases..."
curl -X PUT http://admin:chinhhieu01@127.0.0.1:5984/_users
curl -X PUT http://admin:chinhhieu01@127.0.0.1:5984/_replicator
curl -X PUT http://admin:chinhhieu01@127.0.0.1:5984/_global_changes

# Giữ container chạy
tail -f /opt/couchdb/var/log/couchdb.log
