# -> op-node setup
# FROM ubuntu:22.04
# RUN apt-get update && apt install build-essential git clang gcc curl -y
# RUN curl -sSL https://golang.org/dl/go1.19.5.linux-amd64.tar.gz | tar -v -C /usr/local -xz
# RUN cp /usr/local/go/bin/go /usr/bin/go
#
# RUN git clone https://github.com/ethereum-optimism/optimism && cd optimism/op-node && make && mv bin/op-node /usr/bin/op-node

FROM a16zcrypto/magi:latest

COPY ./magi/magi.sh .
COPY jwttoken/jwt.hex .
COPY ./magi/rollup.json .

RUN chmod +x magi.sh

ENTRYPOINT ["./magi.sh"]
