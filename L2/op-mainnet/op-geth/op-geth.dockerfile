FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-geth:v1.101315.2 AS geth

FROM ubuntu:latest

COPY --from=geth /usr/local/bin/geth /usr/local/bin/op-geth

WORKDIR /

COPY ./op-geth/op-geth.sh /
RUN chmod +x /op-geth.sh
COPY jwttoken/jwt.hex /

ENTRYPOINT ["/op-geth.sh"]
CMD ["run"]
