#!/usr/bin/bash

op-geth \
    --gcmode=archive \
    --state.scheme=hash \
    --http \
    --http.port=8549 \
    --http.addr=0.0.0.0 \
    --http.api web3,eth,debug,admin,net,txpool \
    --http.vhosts='*' \
    --authrpc.addr=0.0.0.0 \
    --authrpc.port=8559 \
    --authrpc.jwtsecret=/jwt.hex \
    --authrpc.vhosts='*' \
    --verbosity=3 \
    --port 30309 \
    --rollup.sequencerhttp=https://mainnet-sequencer.optimism.io/ \
    --op-network=op-sepolia \
    --datadir=/db \
    --syncmode snap \
    --metrics.addr "0.0.0.0" \
    --metrics.port 6069
