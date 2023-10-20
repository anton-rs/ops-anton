#!/bin/sh
set -e

# NETWORK="base"
# JWT_SECRET=./jwt.hex
# L1_RPC_URL="http://reth:8545"
# EXECUTION_CLIENT="op-reth"
# RPC_PORT=6052
# SYNC_MODE="full"
#
# magi \
#     --network $NETWORK \
#     --jwt-secret $(cat $JWT_SECRET) \
#     --l1-rpc-url $L1_RPC_URL \
#     --l2-rpc-url http://${EXECUTION_CLIENT}:9545 \
#     --l2-engine-url http://${EXECUTION_CLIENT}:9551 \
#     --rpc-port $RPC_PORT \
#     --sync-mode $SYNC_MODE \
#     -v

# -> op-node setup
export OP_NODE_L1_ETH_RPC=http://reth:8545

# auth secret used by op-reth engine API:
export OP_NODE_L2_ENGINE_RPC=http://op-reth:9551
export OP_NODE_LOG_LEVEL=info
export OP_NODE_METRICS_ADDR=0.0.0.0
export OP_NODE_METRICS_ENABLED=true
export OP_NODE_METRICS_PORT=9200
export OP_NODE_P2P_AGENT=base
export OP_NODE_P2P_BOOTNODES=enr:-J64QBbwPjPLZ6IOOToOLsSjtFUjjzN66qmBZdUexpO32Klrc458Q24kbty2PdRaLacHM5z-cZQr8mjeQu3pik6jPSOGAYYFIqBfgmlkgnY0gmlwhDaRWFWHb3BzdGFja4SzlAUAiXNlY3AyNTZrMaECmeSnJh7zjKrDSPoNMGXoopeDF4hhpj5I0OsQUUt4u8uDdGNwgiQGg3VkcIIkBg,enr:-J64QAlTCDa188Hl1OGv5_2Kj2nWCsvxMVc_rEnLtw7RPFbOfqUOV6khXT_PH6cC603I2ynY31rSQ8sI9gLeJbfFGaWGAYYFIrpdgmlkgnY0gmlwhANWgzCHb3BzdGFja4SzlAUAiXNlY3AyNTZrMaECkySjcg-2v0uWAsFsZZu43qNHppGr2D5F913Qqs5jDCGDdGNwgiQGg3VkcIIkBg
export OP_NODE_P2P_LISTEN_IP=0.0.0.0
export OP_NODE_P2P_LISTEN_TCP_PORT=9222
export OP_NODE_P2P_LISTEN_UDP_PORT=9222
export OP_NODE_ROLLUP_CONFIG=./rollup.json
export OP_NODE_RPC_ADDR=0.0.0.0
export OP_NODE_RPC_PORT=9000
export OP_NODE_SNAPSHOT_LOG=/tmp/op-node-snapshot-log
export OP_NODE_VERIFIER_L1_CONFS=4

op-node \
        --l1=$OP_NODE_L1_ETH_RPC \
        --l2=$OP_NODE_L2_ENGINE_RPC \
        --rollup.config=./rollup.json \
        --l2.jwt-secret=./jwt.hex \
        --rpc.addr=0.0.0.0 \
        --rpc.port=6052 \
        --l1.trustrpc
