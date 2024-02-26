l1_sepolia_up:
	docker-compose up -d

l1_sepolia_down:
	docker-compose down
	docker image ls 'sepolia-l1*' --format='{{.Repository}}' | xargs -r docker rmi
