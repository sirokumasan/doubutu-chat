# README

## 概要
動物関連の写真投稿アプリです。
写真を投稿したり写真をいいねしたりできます。
ユーザーをフォローしたりもできます。

## URL
https://doubutu.herokuapp.com  
test@test.com
1111111t
6/22日(月)に更新します.  
申し訳ございませんがもうしばらくお待ちください.  
【テストユーザー】など作ります。

## 制作背景
動物の写真を投稿し動物の写真を眺めているだけで心が癒されます。なので、動物が掲載されているサイトを作りたいなと思い、制作に至りました。


## 主な機能
- ユーザー登録、ログイン、ログアウト機能  
![demo](https://gyazo.com/e205405028d75fefb0efb3c614a6d5e2/raw)  
名前、メールアドレス、パスワード（再確認）を入力して新規ユーザー登録ができます。  
一度登録した後は、ログアウトした場合に再度メールアドレスとパスワードを入力することでログインできます。
- 画像・テキスト投稿
- いいね機能
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