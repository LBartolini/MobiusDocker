.DEFAULT_GOAL := up

build:
	docker compose build

up:
	xhost +local:docker
	docker compose up
	xhost -local:docker

down:
	docker compose down