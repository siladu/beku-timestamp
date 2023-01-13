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
rm -rf /tmp/teku
rm -rf "${GENESIS}"


$TEKU genesis mock --output-file "${GENESIS}" --network config.yaml --validator-count 256 

export GENESIS_TIME=$(($(date +%s) + 120)) # 120s until genesis, feel free to increase this to give you more time to everything
SHANGHAI=$(($GENESIS_TIME + 0))
# sed -i'' -e "s/\"shanghaiTime\": .*,/\"shanghaiTime\": $SHANGHAI,/" execution-genesis.json

## devops@withdrawals-teku-besu-1
$TEKU \
 --network=config.yaml \
 --initial-state=genesis.ssz \
 --Xee-version=kilnv2 \
 --data-path=/tmp/teku \
 --data-storage-mode=PRUNE \
 --p2p-enabled=true \
# --p2p-advertised-ip=142.93.108.142 \
 --p2p-port=9000 \
 --p2p-advertised-port=9000 \
 --logging=info \
 --Xnetwork-total-terminal-difficulty-override=9 \
 --p2p-peer-upper-bound=100 \
 --ee-endpoint=http://127.0.0.1:8560 \
 --p2p-discovery-bootnodes=enr:-LK4QNRkwBq94pldu1dSD59kabjcPBirmHVK_ZxKz-v4JhLeOIWQCJUU5_mTaaaWeP2DHLaHa20ryCEgFgU8V0NusOgGh2F0dG5ldHOIAAAAAAAAAACEZXRoMpB39OJhIAAAOQEAAAAAAAAAgmlkgnY0gmlwhJ9BcfuJc2VjcDI1NmsxoQORzaiwV-ogDNaDpB0S2ptorLxgiyGIw39bH1QCO16iu4N0Y3CCIyiDdWRwgiMo \
 --p2p-static-peers=/ip4/159.65.113.251/tcp/9000/p2p/16Uiu2HAmNU9MQSjFBPZHLMsmpGP9xnJ16mkHsm1x8jUy6q9vDTsG \
 --metrics-enabled=true \
 --metrics-interface=0.0.0.0 \
 --metrics-port=8000 \
 --rest-api-enabled=true \
 --rest-api-docs-enabled=true \
 --rest-api-interface=0.0.0.0 \
 --rest-api-port=4000 \
 --metrics-host-allowlist=* \
 --log-destination=console \
 --rest-api-host-allowlist=* \
 --data-storage-non-canonical-blocks-enabled=true \
 --ee-jwt-secret-file="jwtsecret.txt" \
 --Xlog-include-p2p-warnings-enabled \
 --Xmetrics-block-timing-tracking-enabled \
 --Xprogressive-balances-mode=USED
