# Capella Besu Teku test

Based on https://github.com/rolfyone/playground/tree/main/capella/beku (which is based on https://github.com/ajsutton/merge-scripts/tree/main/beku)

## Setup

Using besu [(main branch)](https://github.com/hyperledger/besu)

Build besu and [teku (master branch)](https://github.com/ConsenSys/teku) respectively with `./gradlew installDist`

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Run Teku
Run the `startTeku.sh` 

## Run Besu
Run the `startBesu.sh`

There is a `debugBesu.sh` to enable debug mode.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.
