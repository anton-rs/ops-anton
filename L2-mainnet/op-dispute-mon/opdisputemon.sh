#!/usr/bin/env bash

op-dispute-mon \
    --l1-eth-rpc=http://reth:8545 \
    --rollup-rpc=http://op_node:5058 \
    --game-factory-address=0xe5965Ab5962eDc7477C8520243A95517CD252fA9 \
    --metrics.enabled \
    --metrics.addr=0.0.0.0 \
    --metrics.port=7077
