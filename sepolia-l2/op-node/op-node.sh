#!/bin/sh

exec op-node \
    --l1="https://reth:8546" \
    --l2="http://op-reth:8551" \
    --rpc.addr="0.0.0.0" \
    --rpc.port=9545 \
    --l2.jwt-secret=jwt.hex \
    --l1.trustrpc \
    --l1.rpckind="basic" \
    --l1.beacon="http://sepolia-lighthouse:5055" \
    --metrics.enabled \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7300 \
    --syncmode=execution-layer \
    --network op-sepolia \
    --rollup.load-protocol-versions=true \
    --rollup.halt=major \
    $@
