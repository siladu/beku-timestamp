#!/bin/bash
export GENESIS=$(($(date +%s) + 60)) # 120s until genesis, feel free to increase this to give you more time to everything
SHANGHAI=$(($GENESIS + 48))
sed -i'' -e "s/XXX/'$SHANGHAI'/" execution-genesis.json
