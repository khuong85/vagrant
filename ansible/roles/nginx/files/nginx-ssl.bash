#!/usr/bin/env bash
set -eu

cd
dir=nginx-ssl-`date +%Y%m%d%H%M%S`
mkdir $dir
cd $dir

openssl genrsa -out server.key 2048
openssl req -new -key server.key -subj "/C=VN/ST=Saigon/L=/O=test/OU=/CN=/emailAddress=/" -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
cp server.crt server.key /etc/nginx/
