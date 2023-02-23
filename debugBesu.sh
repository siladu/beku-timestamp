#!/bin/bash
set -euo pipefail

curl --retry-delay 50 --retry-connrefused --location \
     --request POST 'http://127.0.0.1:8545' \
     --header 'Content-Type: application/json' \
     --data-raw '{
    "jsonrpc": "2.0",
    "method": "admin_changeLogLevel",
    "params": [
        "DEBUG", ["org.hyperledger.besu.ethereum.api.jsonrpc", "org.hyperledger.besu.consensus.merge.blockcreation.MergeCoordinator"]
    ],
    "id": 1
}
'

