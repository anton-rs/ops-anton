#!/usr/bin/env bash

op-node \
    --l1=http://sepolia-reth:8546 \
    --l2=http://op-sepolia-reth:8559 \
    --l1.rpckind=standard \
    --l1.trustrpc=true \
    --l1.beacon=http://sepolia-lighthouse:5055 \
    --l2.jwt-secret=/jwt.hex \
    --network=op-sepolia \
    --syncmode=execution-layer \
    --rollup.load-protocol-versions=true \
    --rollup.halt=major \
    --rpc.addr=0.0.0.0 \
    --rpc.port=5059 \
    --metrics.enabled \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7309 \
    --safedb.path=/safe-db
