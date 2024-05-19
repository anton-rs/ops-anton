#!/usr/bin/bash

/usr/local/bin/op-reth node \
    --datadir /db \
    --chain optimism-sepolia \
    --metrics 0.0.0.0:9422 \
    --http \
    --http.port 8547 \
    --http.addr 0.0.0.0 \
    --http.api debug,eth,net,trace,txpool,rpc,web3,admin \
    --authrpc.jwtsecret jwt.hex \
    --authrpc.addr 0.0.0.0 \
    --authrpc.port 8553 \
    --port 30305 \
    -vvv
