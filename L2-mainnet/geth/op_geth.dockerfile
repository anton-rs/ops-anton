FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-geth:v1.101315.1 AS geth

FROM ubuntu:latest

COPY --from=geth /usr/local/bin/geth /usr/local/bin/op-geth

WORKDIR /

COPY ./geth/opgeth.sh /
RUN chmod +x /opgeth.sh
COPY jwttoken/jwt.hex /

ENTRYPOINT ["/opgeth.sh"]
CMD ["run"]
