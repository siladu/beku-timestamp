#!/bin/bash
set -euo pipefail

if [ -z $BESU ]
then
    echo "Set BESU to the besu binary to use..."
    exit 1
fi

rm -rf /tmp/besu
$BESU --config-file besu-config.toml $@
