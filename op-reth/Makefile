all: build-image create-container

build-image:
	docker build . -f ./runner.dockerfile -t actions-runner

create-container:
	docker container create --name "runner-$$(openssl rand -hex 4)" actions-runner
