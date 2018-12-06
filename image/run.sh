#!/bin/bash

echo "executing run.sh......"
echo $CASSNADRA_HOME
echo $PATH
echo $HOSTNAME
sed -i  "s/%%ip%%/$HOSTNAME/g" /etc/cassandra/cassandra.yaml
export CLASSPATH=/kubernetes-cassandra.jar

cassandra -f -R
