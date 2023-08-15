FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

RUN mkdir -p actions-runner && cd actions-runner

RUN curl -o actions-runner-linux-x64-2.307.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.307.1/actions-runner-linux-x64-2.307.1.tar.gz

RUN tar xzf ./actions-runner-linux-x64-2.307.1.tar.gz

RUN ./config.sh --url https://github.com/anton-rs --token AFCNLSXMBG6PJAZZ3EWENHDE3LOGQ

RUN ./run.sh
