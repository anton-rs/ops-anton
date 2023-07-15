#!/usr/bin/bash

/usr/local/bin/lighthouse bn \
  --datadir /db \
  --network mainnet \
  --execution-endpoint "http://localhost:8551" \
  --execution-jwt .secret \
  --checkpoint-sync-url https://mainnet.checkpoint.sigp.io \
  --http \
  --http-port 5052 \
  --disable-deposit-contract-sync
