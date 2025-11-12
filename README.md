# study_de_01_foundation

データサイエンスよりも分析環境を用意したり整理したりする方が好きかもしれないと気付いたので，キャリア変更を真剣に考え始め...  
ただ，クエリパフォーマンスを意識したSQL, DWHのレイヤリング, ちょっとしたワークフローの作成, データモデリングも実務で必要とするくらいでしかやってきていなかった.  
データソースから活用までのパイプライン設計やその実装などはやってきていないので，イマイチ知らないことが沢山ある.  
また, 現業務では関わる機会もほとんどないので, もういっそ自分で勉強することにした.  
なので, 目的は「データエンジニアが担当している業務を最低限こなせる様になるため手を動かして勉強すること」とし,  
勉強内容をフェーズ分けしてその記録をとっていくことにする.  

このリポジトリは1段階目として環境用意を行う

- Phase 1. 基盤構築 👈 イマココ
- Phase 2. データ取得~ELT
- Phase 3. ワークフロー自動化
- Phase 4. クラウド展開とIaC

## Phase 1. 基盤構築

目的: データエンジニアの標準開発環境をDocker上に構築。

** 学習内容 **

- Docker ComposeでPostgres / Airflow / dbtを起動
- DevContainerでVSCode環境統一
- Makefileで環境構築を自動化

** 成果物 **

- `docker-compose.yml`：Airflow＋dbt＋Postgres連携
- `.devcontainer/`：統一開発環境構成
- `README.md`：環境図・起動手順・構成説明
- （学習ノート）`docs/learning_notes.md`

## ディレクトリ構成
これから作るよ

```plain
study_de_01_foundation/
├── docker-compose.yml
├── .env.example
├── Makefile
├── README.md
├── .gitignore
├── db/
│   ├── init.sql        ← 初期スキーマ（空でもOK）
│   └── Dockerfile      ← 拡張が必要な場合のみ
├── dbt_project/
│   ├── dbt_project.yml
│   ├── models/
│   │   └── example/
│   │       └── my_first_model.sql
│   └── profiles.yml
└── docs/
    └── learning_notes.md
```

## 最終管理

📦 **環境準備**

- [ ] VSCode + Docker + Python環境の確認
- [ ] DevContainer設定 (`./devcontainer/`)
- [ ] `.gitignore` 整備

🐘　**PostgresSQL**

- [x]  `docker-compose.yml` でPostgreSQL起動
- [x] DB接続確認 (psql / Adminer)
- [ ] `init.sql` 作成

🔧 **dbt導入**

- [ ] dbt-core + adapter (Postgres) セットアップ
- [ ] `dbt run` 実行でstagingモデル作成
- [ ] `dbt docs generate` 確認

🧰 **補助構成**

- [ ] Makefile追加
- [ ] `.env` で認証情報管理
- [ ] `README.md` に実行手順の項目を作成

🪄 **Airflow**

- [ ] Airflowコンテナ追加
- [ ] DAGテンプレート作成

🧭 **ドキュメント管理**

- [ ] `docs/learning_notes.md` を忘れずに書くこと
- [ ] 環境構成図も作成
