# Makefile

SHELL := /bin/bash

.phony: up, down, load, transform

install:
	sudo apt install postgresql-client-common

up:
	set -o allexport && source .env && set +o allexport && docker-compose up &

down:
	docker-compose down

load: up
	set -o allexport && source .env && set +o allexport && drug_pub_load/load_all.sh
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt seed --profiles-dir .

transform: up
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt run --profiles-dir .
	