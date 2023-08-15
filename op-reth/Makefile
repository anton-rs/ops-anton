all: create-runner

creater-runner:
	docker create $(docker build -q . -f ./runner.dockerfile)
