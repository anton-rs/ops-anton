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

  cd ./L1 && just up
  cd ./L2 && just up

  export UID=$(id -u)
  export GID=$(id -g)
  UID=$UID GID=$GID docker-compose up -d

down:
  #!/bin/bash
  cd ./L1 && just down && cd ..
  cd ./L2 && just down && cd ..

  docker-compose down
  docker image ls "anton-*" --format="\{\{.Repository\}\}" | xargs -r docker rmi
