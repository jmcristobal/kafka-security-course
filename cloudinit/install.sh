#!/bin/bash

set -ex

cd /home/ubuntu

wget http://artfiles.org/apache.org/kafka/2.0.0/kafka_2.11-2.0.0.tgz

tar -xzf kafka_2.11-2.0.0.tgz
rm -rf kafka_2.11-2.0.0.tgz

ln -s kafka_2.11-2.0.0 kafka

tee <<EOF /etc/systemd/system/zookeeper.service >/dev/null
[Unit]
Description=Apache Zookeeper server
Documentation=http://zookeeper.apache.org
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
ExecStart=/home/ubuntu/kafka/bin/zookeeper-server-start.sh /home/ubuntu/kafka/config/zookeeper.properties
ExecStop=/home/ubuntu/kafka/bin/zookeeper-server-stop.sh

[Install]
WantedBy=multi-user.target'
EOF

tee <<EOF /etc/systemd/system/kafka.service >/dev/null
[Unit]
Description=Apache Kafka server (broker)
Documentation=http://kafka.apache.org/documentation.html
Requires=zookeeper.service

[Service]
Type=simple
ExecStart=/home/ubuntu/kafka/bin/kafka-server-start.sh /home/ubuntu/kafka/config/server.properties
ExecStop=/home/ubuntu/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl enable zookeeper
systemctl enable kafka

systemctl start kafka