#!/usr/bin/bash

/usr/local/bin/reth node \
  --datadir /db \
  --chain base \
  --metrics 0.0.0.0:9430 \
  --http \
  --http.port 9545 \
  --http.addr 0.0.0.0 \
  --http.api debug,eth,net,trace,txpool,rpc,web3,admin \
  --authrpc.jwtsecret jwt.hex \
  --authrpc.addr 0.0.0.0 \
  --authrpc.port 9551 \
  --discovery.port 30403 \
  --rollup.sequencer-http https://sequencer.base.org \
  -vvv
