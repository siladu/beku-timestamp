# Dencun Besu Teku test

Based on https://github.com/rolfyone/playground/tree/main/capella/beku (which is based on https://github.com/ajsutton/merge-scripts/tree/main/beku)

## Setup

Either clone with submodule: `git clone --recursive git@github.com:siladu/beku-timestamp.git`

(or add the submodule yourself: `git submodule add https://github.com/ethpandaops/dencun-testnet`)

Checkout this branch: `git checkout dencun-testnet-x`

Update submodule (first time): `git submodule update --init --remote dencun-testnet`

Update submodule: `git submodule update --recursive --remote`

Submodule is https://github.com/ethpandaops/dencun-testnet

Using besu [(main branch)](https://github.com/hyperledger/besu)

Build besu and [teku (master branch)](https://github.com/ConsenSys/teku) respectively with `./gradlew installDist`

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Run Teku
Run `./startTeku.sh devnet-8`

## Run Besu
Run `./startBesu.sh devnet-8`

There is a `debugBesu.sh` to enable debug mode.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.
