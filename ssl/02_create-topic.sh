#!/usr/bin/env bash

# export HOST = your public ec2 DNS

set -ex

/Users/cristjos/tools/kafka/kafka_2.11-2.0.0/bin/kafka-topics.sh --zookeeper $HOST:2181 \
    --create --topic kafka-security-topic --partitions 1 --replication-factor 1
