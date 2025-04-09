FROM apache/couchdb:3.3.2

# Thiết lập user/password CouchDB (Render sẽ đọc biến môi trường)
ENV COUCHDB_USER=admin
ENV COUCHDB_PASSWORD=admin

# Mở cổng CouchDB để Render nhận diện dịch vụ
EXPOSE 5984
