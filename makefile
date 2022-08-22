# Makefile

SHELL := /bin/bash

.phony: up, down, load, transform, output

install:
	sudo apt install postgresql-client-common

up:
	set -o allexport && source .env && set +o allexport && docker-compose up &

down:
	docker-compose down

load: up
	set -o allexport && source .env && set +o allexport && scripts/load_all.sh
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt seed --profiles-dir .

transform: up
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt run --profiles-dir .

export_json:
	set -o allexport && source .env && set +o allexport && scripts/export_from_postgres.sh dev_mrt.mrt__mention_all_json $(PWD)/output/mentions.json

docs:
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt docs generate --profiles-dir .
	docker exec --workdir /usr/app/drug_pub_transform dbt_container   dbt docs serve --profiles-dir .