#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml 

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

rm -rf /tmp/teku

## devnet-4
$TEKU \
 --network=config.yaml \
 --initial-state=genesis.ssz \
 --Xee-version=kilnv2 \
 --data-path=/tmp/teku \
 --data-storage-mode=PRUNE \
 --p2p-enabled=true \
 --p2p-port=9000 \
 --p2p-advertised-port=9000 \
 --logging=info \
 --p2p-peer-upper-bound=100 \
 --ee-endpoint=http://127.0.0.1:8551 \
 --p2p-discovery-bootnodes=enr:-Iq4QMCTfIMXnow27baRUb35Q8iiFHSIDBJh6hQM5Axohhf4b6Kr_cOCu0htQ5WvVqKvFgY28893DHAg8gnBAXsAVqmGAX53x8JggmlkgnY0gmlwhLKAlv6Jc2VjcDI1NmsxoQK6S-Cii_KmfFdUJL2TANL3ksaKUnNXvTCv1tLwXs0QgIN1ZHCCIyk,enr:-Ly4QMiaDqIgFn1ANo9BHr9CWh0syOIzA3QFjU3uNjGPKv2NfX1oKked1GeThGNNqyHXzWUtrv1I7HqGeJAxrMW2M90Bh2F0dG5ldHOIAAAAAAAAAACEZXRoMpAQLtJwQAAAQBQAAAAAAAAAgmlkgnY0gmlwhKRayRSJc2VjcDI1NmsxoQJXlPj-cUCKC9pcs3qhYg0U5s37q8vNhh5nETjpttWoZ4hzeW5jbmV0cwCDdGNwgiMog3VkcIIjKA \
 --p2p-static-peers=/ip4/164.90.201.20/tcp/9000/p2p/16Uiu2HAm1KZCfJXgHWJV6U1GNpXN4N52GsydLnH4x5nC5LraBnqt \
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
