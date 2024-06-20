#!/usr/bin/env bash

op-node \
    --l1=http://reth:8545 \
    --l1.rpckind=standard \
    --l1.beacon=http://lighthouse:5052 \
    --l1.trustrpc=true \
    --l2=http://opgeth:8553 \
    --l2.jwt-secret=/jwt.hex \
    --network=op-mainnet \
    --syncmode=execution-layer \
    --rpc.addr=0.0.0.0 \
    --rpc.port=5058 \
    --metrics.enabled \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7308 \
    --safedb.path=/safe-db
