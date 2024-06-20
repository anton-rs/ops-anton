glance_up:
	docker-compose up -d

glance_down:
	docker-compose down
	docker image ls 'glance*' --format='{{.Repository}}' | xargs -r docker rmi
