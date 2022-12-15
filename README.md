# Capella Besu Teku test

Based on https://github.com/rolfyone/playground/tree/main/capella/beku (which is based on https://github.com/ajsutton/merge-scripts/tree/main/beku)

## Setup

Using besu branch from https://github.com/hyperledger/besu/pull/4818

Build besu and [teku (master branch)](https://github.com/ConsenSys/teku) respectively with `./gradlew installDist`

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```

## Run Besu
Run the `startBesu.sh` script to start the besu instance for the network.

There is a `debugBesu.sh` to enable debug mode.

## Run Teku
Run the `startTeku.sh` script.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.


## Overview

- Besu starts with all forks including shanghaiTime at 0.
- CL Starts with all forks including Capella at 0.

## IMPORTANT 

- If you change any part of the genesis block, then you must run besu, get the modified genesis block hash and update genesis-header.json with it
- genesis-header.json in teku interop mode let's teku know what the besu's genesis hash is so it doesn't try to request it as if the merge transition has happened.
- If you change shanghaiTime to be non-zero, then this will also affect the genesis block hash since withdrawalsRoot will no longer be part of it, so need to update genesis-header.json with the new hash.
