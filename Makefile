all: sys_up

setup:
	@echo "Generating JWT if not already present..."
	@chmod +x ./L1/generate-jwt.sh
	@./L1/generate-jwt.sh
	@echo "JWT generated"
	@echo "Logging out of all docker profiles..."
	@for url in $(cat ~/.docker/config.json | jq -r '.auths | keys | .[]'); do docker logout $url; done
	@echo "Logged out"
	@echo "Creating anton docker network..."
	@docker network inspect anton-net >/dev/null 2>&1 || \
    docker network create anton-net
	@echo "Network created"
	@echo "Anton ready to start. Execute 'make sys_up' to start the system."

sys_up:
	# Start L1 infrastructure
	(cd ./L1 && make l1_up)
	# Start L2 infrastructure
	(cd ./L2 && make l2_up)
	# Start system infrastructure
	export UID=$(id -u)
	export GID=$(id -g)
	UID=$UID GID=$GID docker-compose up -d

sys_down:
	# Gracefully shut down L1 infrastructure
	(cd ./L1 && make l1_down)
	# Gracefully shut down L2 infrastructure
	(cd ./L2 && make l2_down)
	# Shut down system infrastructure
	docker-compose down
	docker image ls 'anton-*' --format='{{.Repository}}' | xargs -r docker rmi
