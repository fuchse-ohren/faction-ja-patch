# OWASP Faction 日本語化パッチ

## 現在の翻訳進捗
20%～30%ぐらい

## 概要
OWASP FactionのWebGUIを日本語化するパッチです。
jspファイルを1行単位でマッチさせて置換する単純なスクリプトと、
置換ルールで構成されています。

また、元のリポジトリの更新を自動的に取り込む仕組みをGithub Actionsにて実現しています。

## クイックセットアップ
前提として`docker-ce`と`docker-compose`が必要になります。

```bash
git clone https://github.com/factionsecurity/faction.git
mv faction
sed -i 's/factionsecurity\/faction/fuchse-ohren\/faction-ja-patch/' Dockerfile
docker compose up --build
```

## 貢献
`rules/translation_rules.tsv`に翻訳の定義を追記してプルリクエストを立ててください。
