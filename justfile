help:
  just --list

setup:
  #!/bin/bash
  echo "Generating JWTs for all services..."
  ./L1/mainnet/generate-jwt.sh
  ./L1/sepolia/generate-jwt.sh
  ./L2/op-mainnet/generate-jwt.sh
  ./L2/op-sepolia/generate-jwt.sh

  echo "Creating docker network..."
  docker network inspect anton-net >/dev/null 2>&1 || docker network create anton-net

  echo "All set up."

up:
  #!/bin/bash

  export UID=$(id -u)
  export GID=$(id -g)
  UID=$UID GID=$GID docker-compose up -d
  echo "Started system resources"

  (cd ./L1 && just up)
  echo "Started L1, waiting 15s before starting L2..."
  sleep 15
  (cd ./L2 && just up)
  echo "Started L2"

down:
  #!/bin/bash
  (cd ./L1 && just down)
  (cd ./L2 && just down)

  docker-compose down
  docker image ls "anton-*" --format="\{\{.Repository\}\}" | xargs -r docker rmi
