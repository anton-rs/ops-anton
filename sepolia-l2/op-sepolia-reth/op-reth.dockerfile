FROM ghcr.io/paradigmxyz/op-reth:latest

COPY ./op-sepolia-reth/op-reth.sh .
RUN chmod +x op-reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./op-reth.sh"]
