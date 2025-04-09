#!/bin/bash

echo "🚀 Starting CouchDB in background..."
couchdb &

echo "⏳ Waiting for CouchDB to start..."
until curl -s http://127.0.0.1:5984/ >/dev/null; do
    sleep 1
done

echo "⚙️ Creating system databases..."
curl -X PUT http://admin:admin@127.0.0.1:5984/_users
curl -X PUT http://admin:admin@127.0.0.1:5984/_replicator
curl -X PUT http://admin:admin@127.0.0.1:5984/_global_changes

echo "✅ CouchDB is ready and system DBs are initialized."

# Keep logs running
tail -f /opt/couchdb/var/log/couchdb.log
