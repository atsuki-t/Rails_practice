# このアプリケーションについて

仮のアプリ名：Rails Apprication

Rails を用いた SNS 風の WEB アプリケーション

新規登録後にスレッドを立てることができ、スレッドには全てのユーザーがコメントすることができる

似たようなアプリケーションとしては Twitter が一番近い

# 起動方法

Docker 環境が必要

- Mac の場合は Docker for Mac 、Windows の場合は Docker for Windows

コンテナの作成と環境構築
```
$ bin/devtool setup
```
コンテナの起動
```
$ bin/devtool start
```
コンテナの起動後、http://localhost:3000 にアクセス
