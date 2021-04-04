# myapp の説明
Rails を用いた SNS 風の WEB アプリケーション
仮のアプリ名：Rails Apprication

新規登録後にスレッドを立てることができ、全てのユーザーがコメントすることができる
Twitter のようなもの

# 起動方法
Docker 環境が必要
- Mac の場合は Docker for Mac 、Windows の場合は Docker for Windows

コンテナの作成と環境構築
$ bin/devtool setup

コンテナの起動
$ bin/devtool start

http://localhost:3000 にアクセス

# 初回のみ
myapp-rails コンテナ内で以下のコマンドを入力
$ bin/rails db:drop && bin/rails db:create && bin/rails db:migrate
