FROM ubuntu:latest

WORKDIR /

RUN apt-get update && apt-get install -y make gcc git jq bash golang wget

RUN wget https://go.dev/dl/go1.20.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.20.1.linux-amd64.tar.gz
RUN git clone https://github.com/ethereum-optimism/optimism && cd optimism/op-dispute-mon && git checkout v1.7.6 && make && mv bin/op-dispute-mon /usr/local/bin/

COPY op-dispute-mon/opdisputemon.sh /
RUN chmod +x /opdisputemon.sh

ENTRYPOINT ["/opdisputemon.sh"]
CMD ["run"]
