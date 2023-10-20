FROM ubuntu:22.04

RUN apt-get update && apt install build-essential git clang gcc curl pkg-config libssl-dev -y
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN git clone https://github.com/anton-rs/op-reth
RUN cd op-reth && git checkout cl/rebase-final && rm -rf Cargo.lock && cargo build --bin reth --release -F optimism && mv ./target/release/reth /usr/local/bin

COPY ./reth/reth.sh .
RUN chmod +x reth.sh
COPY jwttoken/jwt.hex .

ENTRYPOINT ["./reth.sh"]
