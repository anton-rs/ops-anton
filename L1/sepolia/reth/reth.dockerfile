FROM ghcr.io/paradigmxyz/reth:latest

COPY ./reth/reth.sh .
RUN chmod +x reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./reth.sh"]
