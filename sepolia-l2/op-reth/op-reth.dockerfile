FROM ghcr.io/paradigmxyz/op-reth:latest

COPY ./op-reth/op-reth.sh .
RUN chmod +x op-reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./op-reth.sh"]
