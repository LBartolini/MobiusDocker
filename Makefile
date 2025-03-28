.DEFAULT_GOAL := up

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down