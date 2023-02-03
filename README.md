# Capella Besu Teku test

Based on https://github.com/rolfyone/playground/tree/main/capella/beku (which is based on https://github.com/ajsutton/merge-scripts/tree/main/beku)

## Setup

Clone with submodule: `git clone --recursive git@github.com:siladu/beku-timestamp.git`

Checkout this branch: `git checkout withdrawals-devnet-x`

Update submodule (first time): `git submodule update --init --remote withdrawals-testnet`

Update submodule: `git submodule update --recursive --remote`

Submodule is https://github.com/ethpandaops/withdrawals-testnet

Using besu [(main branch)](https://github.com/hyperledger/besu)

Build besu and [teku (master branch)](https://github.com/ConsenSys/teku) respectively with `./gradlew installDist`

Set 2 environment variables, to find besu and teku binaries. These are the locations of the applications that will be run in the start scripts.

```
export BESU=$HOME/IdeaProjects/besu/build/install/besu/bin/besu
export TEKU=$HOME/IdeaProjects/teku/build/install/teku/bin/teku
```


## Run Teku
Run `./startTeku.sh withdrawals-devnet-4` to run withdrawals-devnet-4
Run `./startTeku.sh withdrawals-devnet-6` to run withdrawals-devnet-6 
Run `./startTeku.sh zhejiang-testnet` to run zhejiang-testnet

## Run Besu
Run `./startBesu.sh withdrawals-devnet-4` to run withdrawals-devnet-4
Run `./startBesu.sh withdrawals-devnet-6` to run withdrawals-devnet-6 
Run `./startBesu.sh zhejiang-testnet` to run zhejiang-testnet

There is a `debugBesu.sh` to enable debug mode.

## Cleanup
Run `cleanup.sh` to clean artifacts of these scripts. besu and teku should not be running while this script is run.
