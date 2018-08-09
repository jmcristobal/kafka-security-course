#!/usr/bin/env bash

# export HOST = your public ec2 DNS

set -ex

/Users/cristjos/tools/kafka/kafka_2.11-2.0.0/bin/kafka-console-producer.sh --broker-list $HOST:9093 \
    --topic kafka-security-topic --producer.config client.properties
