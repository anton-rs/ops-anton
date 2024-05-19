FROM us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:v1.7.5

COPY ./op-node/op-node.sh .
RUN chmod +x op-node.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./op-node.sh"]
