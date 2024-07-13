help:
  just --list

setup:
  #!/bin/bash
  echo "todo"

up:
  #!/bin/bash

  cd ./L1 && just up
  cd ./L2 && just up

	export UID=$(id -u)
	export GID=$(id -g)
	UID=$UID GID=$GID docker-compose up -d

  down:
    cd ./L1 && just down
    cd ./L2 && just down

    docker-compose down
    docker image ls 'anton-*' --format='{{.Repository}}' | xargs -r docker rmi
