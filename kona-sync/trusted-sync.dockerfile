FROM ghcr.io/ethereum-optimism/kona/trusted-sync:main AS ts

FROM ubuntu:latest

COPY --from=ts /usr/local/bin/trusted-sync /usr/local/bin/trusted-sync

WORKDIR /

COPY ./trusted-sync.sh /
RUN chmod +x /trusted-sync.sh

ENTRYPOINT ["/trusted-sync.sh"]
