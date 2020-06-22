# README

## 概要
動物関連の写真投稿アプリです。
写真を投稿したり写真をいいねしたりできます。
ユーザーをフォローしたりもできます。

## URL
https://doubutu.herokuapp.com  
メールアドレス: test@test.com  
パスワード:  1111111t  

## 制作背景
動物の写真を投稿し動物の写真を眺めているだけで心が癒されます。なので、動物が掲載されているサイトを作りたいなと思い、制作に至りました。


## 主な機能
- ユーザー登録   
名前、メールアドレス、パスワード（再確認）を入力して新規ユーザー登録ができます。  
![demo](https://gyazo.com/e205405028d75fefb0efb3c614a6d5e2/raw)  
  
- ログイン機能  
一度登録した後は、ログアウトした場合に再度メールアドレスとパスワードを入力することでログインできます。  
![demo](https://gyazo.com/17ce9ee2eee91d42276b37c7b1540de6/raw)  

- トップページ  
投稿が増えてきた時は、並び替えを行うことで、投稿が見やすくなります。  
ページネーションを実装し、1つのページに最大12枚表示されます。  
トップページでマイページ、投稿ページ、ログアウトできます。  
また画像をクリックすると詳細ページに飛びます。
![demo](https://gyazo.com/0f8b4c795b8c485c43fa4aaaac7b6f4e/raw)  

- 投稿機能(複数投稿)  
トップページにある投稿をクリックし、投稿内容を記載後に投稿ボタンを押すと、トップページに反映されます。 
画像投稿は最大6枚投稿できます。  
タブ機能はその他を選択すれば新しいタブを作れます。 
![demo](https://gyazo.com/eb20350608dde2df9216aa07b13c2001/raw)  

- マイページ(いいね機能・コメント機能実装)  
トップページにある画像をクリックすると飛べます。  
いいね機能とコメント機能を非同期通信で実装しました。  
削除機能と編集機能に飛べます。
![demo](https://gyazo.com/4003e7eafab1113adc3169e1b5a93378/raw)  

- フォロワー機能

## 工夫したポイント
- 並び替えができるようにすることで、自分の見たいジャンルの投稿だけを見つけたり、投稿がより見やすくなるようにしました。

## 使用技術
- Ruby
- Ruby on Rails
- MySQL
- Github

## DB設計
### usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false, unique: true|
|email|integer|null: false, unique: true|
|pfofiel|string|
|password_digest|integer|null: false|
|remember_digest|integer|null: false|

#### Association
- has_many :messages
- has_many :comments
- has_many :likes,  dependent: :destroy
- has_many :liked_messages, through: :likes, source: :message
- has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy
- has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
- has_many :following, through: :active_relationships,  source: :followed
- has_many :followers, through: :passive_relationships, source: :follower


### messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user|references|null: false, foregin_key: true|

#### Association
- belongs_to :user
- has_many   :images,       dependent: :destroy
- has_many   :comments,     dependent: :destroy
- has_many   :likes,        dependent: :destroy
- has_many   :liked_users,  through: :likes, source: :user
- has_many   :message_tags, dependent: :destroy
- has_many   :tags,         through: :message_tags


### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to  :message,  optional: true

### commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foregin_key: true|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to :user
- belongs_to :message

### likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foregin_key: true|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to :user
- belongs_to :message

### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follower_id|references|null: false, foregin_key: true|
|followed_id|references|null: false, foregin_key: true|

#### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|tag_name|string|null: false|

#### Association
- has_many :message_tags
- has_many :messages,  through: :message_tags

### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|message|references|null: false, foregin_key: true|
|tag|references|null: false, foregin_key: true|

#### Association
- belongs_to :message
- belongs_to :tag