#!/bin/bash
set -euo pipefail

if [ -z $BESU ]
then
    echo "Set BESU to the besu binary to use..."
    exit 1
fi

#export LOG4J_CONFIGURATION_FILE=./log4j2-besu.xml 

export BESU_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005

rm -rf /tmp/besu
$BESU --config-file besu-config.toml $@
