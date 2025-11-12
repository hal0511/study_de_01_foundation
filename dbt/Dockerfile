# Dockerfile自体不要な場合がある
# compose.ymlに公式イメージや誰かの軽量イメージ引っ張ってくるように書けばいいので

FROM python:3.11-slim

# ログがすぐ出る様にする, 本番では不要. 
ENV PYTHONUNBUFFERED=1

# 勉強で使う範囲ではgitにあるdbtのライブラリはいらないだろうけど一応入れておく
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/list/*

RUN pip install --no-cache-dir dbt-core dbt-postgres

WORKDIR /usr/app/dbt

# このコンテナが起動してもbashを実行させるわけではないのでエントリーポイントは書かない