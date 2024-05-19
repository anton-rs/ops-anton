l2_sepolia_up:
	docker-compose up -d

l2_sepolia_down:
	docker-compose down
	docker image ls 'sepolia-l2*' --format='{{.Repository}}' | xargs -r docker rmi
