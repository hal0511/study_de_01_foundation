# docker-composeについて
## 実行順序
 YAMLの中で書く順番は関係ない．インデントと論理関係による. ちゃんとComposeが組み立ててくれる

```yaml
services:
    postgres:
        ...
volumes:
    postgres_data:
networks:
    de_network:
```
- `service:` → 実際に起動するコンテナの定義
- `volumes:` → コンテナが使う永続データ利用域
- `networks:` → コンテナ間通信のための仮想ネットワーク

## networkについて
Composeはデフォルトでも自動でネットワークを作成してくれる.   
でも, 後からサービスを追加するときには明示しておいた方が便利.

初めはpostgresだけでも，後から追加するときぶら下げる形にすればokなので
```yaml
servoce:
    postgres:
        ...
        networks:
            - de_network
    
    airflow:
        ...
        networks:
            - de_network
```

## `./db/init.sql` について
`/docker-entrypoint-initdb.d/` に `.sql` や `.sh` を入れておくと, DBがからの状態の時に自動実行してくれる

↓みたいなのとか
```sql
CREATE TABLE sample
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## `healthcheck` の意味

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}"]
  interval: 10s
  timeout: 5s
  retries: 5
  start_period: 5s
```
- `pg_isready` は Postgres が接続可能かを確認するコマンド
- `interval: 10s` → 10秒ごとにチェック
- `retries: 5` → 5回失敗で「不健康」と判定
- `start_period: 5s` → 起動直後5秒は待つ（すぐは立ち上がらないため）

これを設定しておくと、将来 airflow や dbt を追加した際に.   
「Postgres がまだ起動してないのに接続しようとして落ちる」事故を防げます。
（depends_on: condition: service_healthy で連携可能）