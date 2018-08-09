#!/usr/bin/env bash

# export HOST = your public ec2 DNS

set -ex

/Users/cristjos/tools/kafka/kafka_2.11-2.0.0/bin/kafka-console-consumer.sh --bootstrap-server $HOST:9093 \
    --topic kafka-security-topic --consumer.config client.properties --from-beginning
