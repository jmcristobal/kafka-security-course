#!/usr/bin/env bash

# export HOST = your public ec2 DNS
# export CLIPASS = kafka.client.trustore.jsk password

scp -i ../keys/mykey ubuntu@$HOST:/home/ubuntu/ssl/ca-cert .
keytool -keystore kafka.client.truststore.jks -alias CARoot -import -file ca-cert -storepass $CLIPASS -keypass $CLIPASS -noprompt