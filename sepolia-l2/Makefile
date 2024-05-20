up:
	mkdir /drives/L2/volumes/sepolia-op-node/ -p
	mkdir /drives/L2/volumes/sepolia-op-reth/ -p
	mkdir /drives/L2/volumes/sepolia-op-dispute-mon/ -p
	mkdir /drives/L2/volumes/sepolia-op-node/jwttoken/ -p
	cp ./jwttoken/jwt.hex /drives/L2/volumes/sepolia-op-node/jwttoken/
	docker-compose up -d

down:
	docker-compose down
	docker image ls 'sepolia-l2*' --format='{{.Repository}}' | xargs -r docker rmi
	docker volume ls --filter 'dangling=true' --quiet | xargs -r docker volume remove 

