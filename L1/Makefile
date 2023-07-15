l1_up:
	docker-compose up -d

l1_down:
	docker-compose down
	docker image ls 'l1-*' --format='{{.Repository}}' | xargs -r docker rmi
