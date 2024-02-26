#!/usr/bin/bash

/usr/local/bin/lighthouse bn \
  --datadir /db \
  --network sepolia \
  --execution-endpoint "http://sepolia-reth:8552" \
  --execution-jwt jwt.hex \
  --checkpoint-sync-url https://beaconstate-sepolia.chainsafe.io \
  --http \
  --http-port 5055 \
  --http-address 0.0.0.0 \
  --disable-deposit-contract-sync \
  --metrics \
  --metrics-address 0.0.0.0 \
  --metrics-port 5057
