DOCKER_TAG = bamboog130/hie

build:
	docker build --no-cache -t $(DOCKER_TAG):test .
	docker image prune -f
