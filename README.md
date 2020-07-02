# 9_1_AzumaTomoaki

Media Bookmark と言ってメディアのブックマークを作成共有するアプリです。
今までのCoten listner を汎用化したものです。今はYoutubeだけのリンクですが、様々なメディアへのリンクを考えています。

Laravel で実装しています。　Laravelはdockerにて実行していますので以下が必要になります。
すでにあるサーバー環境の場合は my-ytbm フォルダ以下が実体です。

## 立ち上げ方
docker と docker-compose がインストールされている環境ということを前提にして以下を実行。

```
docker-compose up -d
```

docker立ち上げ後に設定した項目はないと記憶していますが、もしあったらすみません。

立ち上げ後、データベースmaigration -> SQLのインポートでデータが復元されるかと思います。
SQLはmy-ytbm.sqlです。

立ち上げ後のlogin は User: azumau@gmail.com   Password: tomotomo
でログインできます。もちろん新規ユーザ作成してブックマーク作成も可能です。

立ち上げ後 Edit My MBM メニューで新規ブックマークの追加、ブックマーク内の番組追加ができます。

Share MBM メニューでは実際に閲覧する画面を表示できます。URLクリックでできます。
URLのリンク先はログインが必要ないので第三者に教えてあげてブックマークをシェアできる。というのが味噌です。



