#!/bin/bash
set -euo pipefail

curl --retry-delay 50 --retry-connrefused --location \
     --request POST 'http://127.0.0.1:8545' \
     --header 'Content-Type: application/json' \
     --data-raw '{
    "jsonrpc": "2.0",
    "method": "admin_changeLogLevel",
    "params": [
        "DEBUG", ["org.hyperledger.besu"]
    ],
    "id": 1
}'

curl --retry-delay 50 --retry-connrefused --location \
     --request POST 'http://127.0.0.1:8545' \
     --header 'Content-Type: application/json' \
     --data-raw '{
    "jsonrpc": "2.0",
    "method": "admin_changeLogLevel",
    "params": [
        "INFO", [
          "org.hyperledger.besu.ethereum.eth.sync.backwardsync",
          "org.hyperledger.besu.ethereum.p2p",
          "org.hyperledger.besu.ethereum.eth.manager.EthProtocolManager",
          "org.hyperledger.besu.ethereum.eth.manager.EthPeer",
          "org.hyperledger.besu.ethereum.eth.manager.EthPeers",
          "org.hyperledger.besu.ethereum.eth.manager.task.RetryingGetHeadersEndingAtFromPeerByHashTask",
          "org.hyperledger.besu.ethereum.eth.sync.backwardsync.BackwardChain",
          "org.hyperledger.besu.ethereum.eth.sync.backwardsync.ProcessKnownAncestorsStep",
          "org.hyperledger.besu.ethereum.eth.transactions",
          "org.hyperledger.besu.ethereum.blockcreation.BlockTransactionSelector",
          "org.hyperledger.besu.consensus.merge.PostMergeContext",
          "org.hyperledger.besu.consensus.merge.UnverifiedForkchoiceSupplier",
          "org.hyperledger.besu.consensus.merge.TransitionProtocolSchedule",
          "org.hyperledger.besu.ethereum.bonsai"
        ]
    ],
    "id": 1
}'
