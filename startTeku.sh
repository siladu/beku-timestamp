#!/bin/bash
set -euo pipefail

#export LOG4J_CONFIGURATION_FILE=./log4j2-test.xml 

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [ -z "$TEKU" ]
then
    echo "Set TEKU to the teku binary to run..."
    exit 1
fi

# GENESIS="${SCRIPTDIR}/beku-genesis.ssz"
rm -rf /tmp/teku
# rm -rf "${GENESIS}"


# $TEKU genesis mock --output-file "${GENESIS}" --network config.yaml --validator-count 256 

# export GENESIS_TIME=$(($(date +%s) + 120)) # 120s until genesis, feel free to increase this to give you more time to everything
# SHANGHAI=$(($GENESIS_TIME + 0))
# sed -i'' -e "s/\"shanghaiTime\": .*,/\"shanghaiTime\": $SHANGHAI,/" execution-genesis.json

## devops@withdrawals-teku-besu-1
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
 --Xnetwork-total-terminal-difficulty-override=9 \
 --p2p-peer-upper-bound=100 \
 --ee-endpoint=http://127.0.0.1:8551 \
 --p2p-discovery-bootnodes=enr:-Iq4QMCTfIMXnow27baRUb35Q8iiFHSIDBJh6hQM5Axohhf4b6Kr_cOCu0htQ5WvVqKvFgY28893DHAg8gnBAXsAVqmGAX53x8JggmlkgnY0gmlwhLKAlv6Jc2VjcDI1NmsxoQK6S-Cii_KmfFdUJL2TANL3ksaKUnNXvTCv1tLwXs0QgIN1ZHCCIyk,enr:-KG4QLZoy4fvyb6QXhRon3JOn_FHHA5kcMGmGfmsnjzfs_MPLN4PzZGw2uFtf7rRGKabgqxMr3FIPFtpYr-bQ3z4sMQDhGV0aDKQEQKFwEAAAEAUAAAAAAAAAIJpZIJ2NIJpcISl6FxaiXNlY3AyNTZrMaEC2EWXXpG8OmVRTsMLMJtd2E513uJLHh680G8QD7Lmfz-DdGNwgiMog3VkcIIjKA \
 --p2p-static-peers=/ip4/165.232.92.90/udp/9000/p2p/16Uiu2HAm9yub9gYtSpNLk6Q7CbjbsWtzkCicTrTuxochgJa2iuEe \
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

#  --network=/custom_config_data/config.yaml --initial-state=/custom_config_data/genesis.ssz --Xee-version=kilnv2 
# --data-path=/beacondata --data-storage-mode=PRUNE --p2p-enabled=true --p2p-advertised-ip=161.35.83.94 --p2p-port=9000 --p2p-advertised-port=9000 
# --logging=info --p2p-peer-upper-bound=100 --ee-endpoint=http://127.0.0.1:8560 
# --p2p-discovery-bootnodes=enr:-Iq4QMCTfIMXnow27baRUb35Q8iiFHSIDBJh6hQM5Axohhf4b6Kr_cOCu0htQ5WvVqKvFgY28893DHAg8gnBAXsAVqmGAX53x8JggmlkgnY0gmlwhLKAlv6Jc2VjcDI1NmsxoQK6S-Cii_KmfFdUJL2TANL3ksaKUnNXvTCv1tLwXs0QgIN1ZHCCIyk,enr:-KG4QLZoy4fvyb6QXhRon3JOn_FHHA5kcMGmGfmsnjzfs_MPLN4PzZGw2uFtf7rRGKabgqxMr3FIPFtpYr-bQ3z4sMQDhGV0aDKQEQKFwEAAAEAUAAAAAAAAAIJpZIJ2NIJpcISl6FxaiXNlY3AyNTZrMaEC2EWXXpG8OmVRTsMLMJtd2E513uJLHh680G8QD7Lmfz-DdGNwgiMog3VkcIIjKA --p2p-static-peers=/ip4/165.232.92.90/udp/9000/p2p/16Uiu2HAm9yub9gYtSpNLk6Q7CbjbsWtzkCicTrTuxochgJa2iuEe 
# --metrics-enabled=true --metrics-interface=0.0.0.0 --metrics-port=8000 --rest-api-enabled=true --rest-api-docs-enabled=true 
# --rest-api-interface=0.0.0.0 --rest-api-port=4000 --metrics-host-allowlist=* --log-destination=console --rest-api-host-allowlist=* 
# --data-storage-non-canonical-blocks-enabled=true --validators-proposer-default-fee-recipient=0xf97e180c050e5Ab072211Ad2C213Eb5AEE4DF134 
# --validators-graffiti=teku-besu --validator-keys=/validatordata/keys:/validatordata/secrets --validators-keystore-locking-enabled=false 
# --ee-jwt-secret-file=/jwtsecret --Xlog-include-p2p-warnings-enabled --Xmetrics-block-timing-tracking-enabled --Xprogressive-balances-mode=USED