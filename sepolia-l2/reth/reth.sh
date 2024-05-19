#!/usr/bin/bash

/usr/local/bin/op-reth node \
    --datadir /db \
    --chain optimism-sepolia \
    --metrics 0.0.0.0:9421 \
    --http \
    --http.port 8546 \
    --http.addr 0.0.0.0 \
    --http.api debug,eth,net,trace,txpool,rpc,web3,admin \
    --authrpc.jwtsecret jwt.hex \
    --authrpc.addr 0.0.0.0 \
    --authrpc.port 8552 \
    --port 30304 \
    -vvv
