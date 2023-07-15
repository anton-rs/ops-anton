sys_up:
	# Start L1 infrastructure
	(cd ./L1 && make l1_up)
	# Start system infrastructure
	docker-compose up -d

sys_down:
	# Gracefully shut down L1 infrastructure
	(cd ./L1 && make l1_down)
	# Shut down system infrastructure
	docker-compose down
	docker image ls 'anton-*' --format='{{.Repository}}' | xargs -r docker rmi
