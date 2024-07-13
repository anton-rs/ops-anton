# `anton`

This repository contains all of the Dockerfiles and devops scripts for Anton.

## Usage

Begin by installing dependencies:

- [Docker](https://docs.docker.com/get-docker/)

Then, create a shared network named `anton-net` for the containers to communicate over:

```bash
docker network create anton-net
```

To spin up the whole system, run `make sys_up`. This will build the images for the system utilities (Grafana, Prometheus, Portainer) as well as the L1
clients and start them in a container stack.

To spin down the system, run `make sys_down`. This will stop the containers and purge their images.

## Ports

### Services

| Service       | Port   |
| ------------- | ------ |
| Grafana       | `6150` |
| Prometheus    | `9090` |
| Portainer     | `9000` |
| Node Exporter | `9100` |

### L1 Nodes

| Service                        | Port   |
| ------------------------------ | ------ |
| Lighthouse (Mainnet)           | `5052` |
| Lighthouse (Mainnet - Metrics) | `5054` |
| Reth (Mainnet)                 | `8545` |
| Reth (Mainnet - Engine)        | `8551` |
| Reth (Mainnet - Metrics)       | `9420` |
| ETH Metrics Exporter (Mainnet) | `9300` |
| Lighthouse (Sepolia)           | `5055` |
| Lighthouse (Sepolia - Metrics) | `5057` |
| Reth (Sepolia)                 | `8546` |
| Reth (Sepolia - Engine)        | `8552` |
| Reth (Sepolia - Metrics)       | `9421` |
| ETH Metrics Exporter (Sepolia) | `9301` |

### L2 Nodes

| Service                           | Port    |
| --------------------------------- | ------- |
| OP Geth (OP Mainnet)              | `8547`  |
| OP Geth (OP Mainnet) - Discovery  | `30306` |
| OP Geth (OP Mainnet) - Engine     | `8553`  |
| OP Geth (OP Mainnet) - Metrics    | `6060`  |
| OP Node (OP Mainnet)              | `5058`  |
| OP Node (OP Mainnet) - Metrics    | `7308`  |
| ETH Metrics Exporter (OP Mainnet) | `9302`  |
| OP Geth (OP Sepolia)              | `8548`  |
| OP Geth (OP Sepolia) - Discovery  | `30307` |
| OP Geth (OP Sepolia) - Engine     | `8554`  |
| OP Geth (OP Sepolia) - Metrics    | `6061`  |
| OP Node (OP Sepolia)              | `5059`  |
| OP Node (OP Sepolia) - P2P        | `9222`  |
| OP Node (OP Sepolia) - Metrics    | `7309`  |
| ETH Metrics Exporter (OP Sepolia) | `9303`  |
