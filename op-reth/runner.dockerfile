FROM ubuntu:latest 

ARG DEBIAN_FRONTEND=noninteractive
ARG RUNNER_VERSION="2.308.0"

RUN apt update -y && apt upgrade -y && useradd -m docker
RUN apt install -y --no-install-recommends \
curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip clang

RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
&& curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
&& tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER docker

ENTRYPOINT ["./start.sh"]
