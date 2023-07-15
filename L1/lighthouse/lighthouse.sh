#!/usr/bin/bash

/usr/local/bin/lighthouse bn \
  --datadir /db \
  --network mainnet \
  --execution-endpoint "http://reth:8551" \
  --execution-jwt jwt.hex \
  --checkpoint-sync-url https://mainnet.checkpoint.sigp.io \
  --http \
  --http-port 5052 \
  --disable-deposit-contract-sync \
  --metrics \
  --metrics-address 0.0.0.0 \
  --metrics-port 5054
