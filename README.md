# Capella Besu Teku test

Based on https://github.com/rolfyone/playground/tree/main/capella/beku (which is based on https://github.com/ajsutton/merge-scripts/tree/main/beku)

## Setup

Using besu branch from https://github.com/hyperledger/besu/pull/4758

Build besu and [teku (master branch)](https://github.com/ConsenSys/teku) respectively with `./gradlew installDist`

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Run Teku
Run the `startTeku.sh` script to generate the value for shanghaiTimestamp (a time in the future) and start the teku instance for the network.

## Run Besu
Shortly afterwards, run the `startBesu.sh` script to start the besu instance for the network.

There is a `debugBesu.sh` to enable debug mode.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.


## Overview

 - Besu starts, produces 1 PoW block, where it hits TTD, and waits for CL.
 - CL Starts in bellatrix at genesis (0)
 - TTD detected as soon as it can request from besu (it may do some optimistic sync first)
 - Capella transition is epoch 1 (slot 4).
 - Currently, there's a misalignment where Capella transitions before Shanghai so we get Invalid payload attribute errors for a while as teku retries, however eventually it crosses the shanghaiTimestamp and starts working
