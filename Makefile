# ===================
# envを読み込む
# ===================
include .env
export $(shell sed 's/=.*//' .env)

# ===================
# 変数
# ===================
COMPOSE = docker compose

# ===================
# compose up / down
# ===================
up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v

# ===================================
# Postgresql
# exec --rm はプロセス消去、コンテナは残る
# ===================================
psql:
	docker compose exec --rm postgres psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

# ===================================
# Postgresql
# exec --rm はプロセス消去、コンテナは残る
# ===================================
bash-dbt:
	docker compose exec --rm dbt bash

# ===================================
# Python (REST API叩いてデータ取ってくる)
# run --rm はコンテナ削除、ここは使い捨て
# ===================================
bash-python:
	$(COMPOSE) run --rm \
	--network=de_network \
	python bash
