up:
	docker-compose up -d

down:
	docker-compose down
	docker image ls 'trusted-sync*' --format='{{.Repository}}' | xargs -r docker rmi

prune: down
	docker system prune --all -f
