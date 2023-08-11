# `anton`

This repository contains all of the Dockerfiles and devops scripts for Anton.

## Usage

Begin by installing dependencies:
* [Docker](https://docs.docker.com/get-docker/)

Then, create a shared network named `anton-net` for the containers to communicate over:
```bash
docker network create anton-net
```

To spin up the whole system, run `make sys_up`. This will build the images for the system utilities (Grafana, Prometheus, Portainer) as well as the L1
clients and start them in a container stack.

To spin down the system, run `make sys_down`. This will stop the containers and purge their images.

## Volumes

> **Note**
> DO NOT purge these volumes unless you want to lose data.

| Volume Name       | Description               |
| ----------------- | ------------------------- |
| `portainer_data`  | Portainer data directory  |
| `prometheus_data` | Prometheus data directory |
| `grafana_data`    | Grafana data directory    |
| `cl_data`         | Lighthouse data directory |
| `el_data`         | Reth data directory       |

## Ports
| Service              | Port   |
| -------------------- | ------ |
| Grafana              | `6150` |
| Prometheus           | `9090` |
| Portainer            | `9000` |
| Node Exporter        | `9100` |
| Lighthouse           | `5052` |
| Lighthouse (Metrics) | `5054` |
| Reth                 | `8545` |
| Reth (Engine)        | `8551` |
| Reth (Metrics)       | `9420` |
| ETH Metrics Exporter | `9200` |
