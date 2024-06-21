up:
	docker-compose up -d --build

down:
	docker-compose down
	docker image ls 'sepolia-l2*' --format='{{.Repository}}' | xargs -r docker rmi

prune: down
	docker system prune --all -f
	rm -rf /drives/L2/op-sepolia/*
