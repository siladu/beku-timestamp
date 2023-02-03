#!/bin/bash
set -euo pipefail

if [ -z $BESU ]
then
    echo "Set BESU to the besu binary to use..."
    exit 1
fi

#export LOG4J_CONFIGURATION_FILE=./log4j2-besu.xml 
export BESU_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005

TESTNET_DIR=${1:-withdrawal-devnet-6}
export DEVNET_PATH=withdrawals-testnet/$TESTNET_DIR/
export CONFIG_PATH=${DEVNET_PATH}custom_config_data/

#rm -rf /tmp/besu
$BESU \
 --data-path="/tmp/besu" \
 --genesis-file="${CONFIG_PATH}besu.json" \
 --max-peers=100 \
 --rpc-http-enabled=true \
 --rpc-http-api="ADMIN,CLIQUE,MINER,ETH,NET,DEBUG,TXPOOL,ENGINE,TRACE" \
 --rpc-http-host="0.0.0.0" \
 --rpc-http-port=8545 \
 --engine-rpc-enabled=true \
 --engine-rpc-port=8551 \
 --engine-host-allowlist="*" \
 --rpc-http-cors-origins="*" \
 --rpc-ws-enabled=true \
 --rpc-ws-api="ADMIN,CLIQUE,MINER,ETH,NET,DEBUG,TXPOOL,ENGINE,TRACE" \
 --rpc-ws-host="0.0.0.0" \
 --host-allowlist="*" \
 --metrics-enabled=true \
 --metrics-host="0.0.0.0" \
 --metrics-port=8002 \
 --p2p-enabled=true \
 --sync-mode="FULL" \
 --data-storage-format="BONSAI" \
 --engine-jwt-disabled=true \
 --engine-jwt-secret="jwtsecret.txt" \
 --miner-coinbase="0xf97e180c050e5Ab072211Ad2C213Eb5AEE4DF134" \
 --bootnodes=`grep "enode://" ${DEVNET_PATH}/inventory/group_vars/all.yaml | tr -d "-" | tr -d " " | tr -d "\"" | paste -sd , -`
