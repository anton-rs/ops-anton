FROM ubuntu:latest

WORKDIR /

RUN apt-get update && apt-get install -y make gcc git jq bash golang wget

RUN wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
RUN git clone https://github.com/ethereum-optimism/optimism && cd optimism/op-node && make && mv bin/op-node /usr/local/bin/

COPY op-sepolia-node/op-node.sh /
RUN chmod +x /op-node.sh
COPY jwttoken/jwt.hex /

ENTRYPOINT ["/op-node.sh"]
CMD ["run"]
