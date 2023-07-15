#!/usr/bin/bash

/usr/local/bin/reth node \
  --datadir /db \
  --chain mainnet \
  --metrics 0.0.0.0:9090 \
  --http \
  --http.port 8545 \
  --http.addr 0.0.0.0 \
  --http.api debug,eth,trace,txpool,rpc,web3,admin \
  --authrpc.jwtsecret .secret \
  --authrpc.port 8551 \
  -vvv
