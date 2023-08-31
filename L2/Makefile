l2_up:
	docker-compose up -d

l2_down:
	docker-compose down
	docker image ls 'l2*' --format='{{.Repository}}' | xargs -r docker rmi
