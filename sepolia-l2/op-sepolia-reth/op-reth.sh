#!/usr/bin/bash

/usr/local/bin/op-reth node \
    --datadir /db \
    --chain optimism-sepolia \
    --rollup.sequencer-http "https://sepolia-sequencer.optimism.io/" \
    --metrics 0.0.0.0:9422 \
    --http \
    --http.port 8549 \
    --http.addr 0.0.0.0 \
    --http.api debug,eth,net,trace,txpool,rpc,web3,admin \
    --authrpc.jwtsecret jwt.hex \
    --authrpc.addr 0.0.0.0 \
    --authrpc.port 8559 \
    --port 30309 \
    -vvv
