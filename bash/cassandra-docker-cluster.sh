!#/bin/bash

if [ -z "$SEED_IP" ]; then
    echo "SEED_IP is not set.  Use the command SEED_IP=\$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' <cassandra_name>)"
    exit -1
fi

for name in name{2..5}; do
    echo "Starting node $name"
    docker run -d --name $name -e SEED=$SEED_IP cassandra:latest
    sleep 10
done

