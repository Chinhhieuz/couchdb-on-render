#!/bin/bash

# Khởi động CouchDB nền
echo "🚀 Starting CouchDB in background..."
/opt/couchdb/bin/couchdb &

# Lấy PID của CouchDB để theo dõi sau này
COUCHDB_PID=$!

# Đợi CouchDB sẵn sàng
echo "⏳ Waiting for CouchDB to start..."
until curl -s http://127.0.0.1:5984 >/dev/null; do
  sleep 1
done

# Tạo system DB nếu chưa có
echo "⚙️ Creating system databases..."
for db in _users _replicator _global_changes; do
  curl -fs -X PUT http://admin:chinhhieu01@127.0.0.1:5984/$db || echo "⚠️ Failed to create $db (might already exist)"
done

echo "✅ CouchDB is ready and system DBs are initialized."

# Theo dõi log để giữ container sống và hiển thị log ra stdout
tail --pid=$COUCHDB_PID -f /opt/couchdb/var/log/couchdb.log
