#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml 

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

GENESIS="${SCRIPTDIR}/beku-genesis.ssz"
#rm -rf /tmp/teku
rm -rf "${GENESIS}"


$TEKU genesis mock --output-file "${GENESIS}" --network config.yaml --validator-count 256 

export GENESIS_TIME=$(($(date +%s) + 120)) # 120s until genesis, feel free to increase this to give you more time to everything
SHANGHAI=$(($GENESIS_TIME + 0))
# sed -i'' -e "s/\"shanghaiTime\": .*,/\"shanghaiTime\": $SHANGHAI,/" execution-genesis.json

$TEKU \
  --ee-endpoint http://127.0.0.1:8551 \
  --ee-jwt-secret-file="jwtsecret.txt" \
  --validators-proposer-default-fee-recipient=0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b \
  --metrics-enabled=true \
  --metrics-host-allowlist="*" \
  --metrics-interface="0.0.0.0" \
  --Xinterop-enabled=true \
  --Xinterop-number-of-validators=256 \
  --Xinterop-owned-validator-start-index=0 \
  --Xinterop-owned-validator-count=256 \
  --network=config.yaml \
  --p2p-private-key-file=teku.key \
  --rest-api-enabled \
  --rest-api-docs-enabled \
  --Xstartup-target-peer-count=0 \
  --Xstartup-timeout-seconds=0 \
  --data-path /tmp/teku



#  --initial-state "${GENESIS}" \
