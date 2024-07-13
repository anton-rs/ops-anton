#!/usr/bin/bash

trusted-sync \
    --l1-rpc-url http://reth:8545 \
    --l2-rpc-url http://opgeth:8547 \
    --beacon-url http://lighthouse:5052 \
    --loki-metrics \
    --loki-url http://kona-loki:3100 \
    --metrics-url 0.0.0.0:9653 \
    -v

# trusted-sync \
    #     --l1-rpc-url http://sepolia-reth:8546 \
    #     --l2-rpc-url http://op-sepolia-geth:8549 \
    #     --beacon-url http://sepolia-lighthouse:5055 \
    #     --loki-url http://kona-loki:3100 \
    #     --start-l2-block 13800000 \
    #     --metrics-server-addr 0.0.0.0 \
    #     --metrics-server-port 9653 \
    #     -v
