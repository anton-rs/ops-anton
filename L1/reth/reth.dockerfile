FROM ghcr.io/paradigmxyz/reth:v0.1.0-alpha.3

COPY ./reth/reth.sh .
RUN chmod +x reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./reth.sh"]
