#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml 

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

TESTNET_DIR=${1:-devnet-8}
export DEVNET_REPO=dencun-testnet
export CONFIG_PATH=${DEVNET_REPO}/network-configs/${TESTNET_DIR}/

#rm -rf /tmp/teku

$TEKU \
 --network=${CONFIG_PATH}config.yaml \
 --initial-state=${CONFIG_PATH}genesis.ssz \
 --data-path=/tmp/teku \
 --data-storage-mode=PRUNE \
 --p2p-enabled=true \
 --p2p-port=9000 \
 --p2p-advertised-port=9000 \
 --logging=info \
 --p2p-peer-upper-bound=100 \
 --ee-endpoint=http://127.0.0.1:8551 \
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
 --metrics-block-timing-tracking-enabled \
 --p2p-discovery-bootnodes=enr:-Iq4QO1muovGRR8-Okbsm6ipEw8CYs_ZP0TWlf9nelJaoVIaIDtpwiDeQlRLGcppukTWuaerLTp-tHwZJYJN3IUv-n2GAYn9uwt0gmlkgnY0gmlwhI5dg7OJc2VjcDI1NmsxoQPZLBX2rEiQ20AfN2f1SQLfnGMQd_t7Rq0-HNkYA9d4uoN1ZHCCIyk,enr:-LK4QE_oehtctXx_uR862hXr6ZnXRDvHRnm7lc0tqpd0grfRJ-mK1ocAiKDwCZTJw0RbbKqSHUW0IBdk1TJu9oikz7YEh2F0dG5ldHOIAAAAAIABAACEZXRoMpC8NFLzQBCTlgUAAAAAAAAAgmlkgnY0gmlwhI5dg7OJc2VjcDI1NmsxoQImVFXk-j9jwl35k8ThDfk4v2e4sD5OvlCSRpISYMSpBYN0Y3CCIyiDdWRwgiMo
# --p2p-discovery-bootnodes=`grep "enr:" ${DEVNET_PATH}/inventory/group_vars/all.yaml | tr -d " " | cut -c 2- | tr -d " " | tr -d "\"" | paste -sd , -`
# --p2p-static-peers=`grep "ip4" ${DEVNET_PATH}/inventory/group_vars/all.yaml | tr -d "-" | tr -d " " | tr -d "\"" | paste -sd , -` 
