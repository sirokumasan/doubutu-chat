# README

## 概要
動物関連の写真投稿アプリです。
写真を投稿したり写真をいいねしたりできます。
ユーザーをフォローしたりもできます。

## 使用技術
- Ruby
- Ruby on Rails
- MySQL
- Github

## 主な機能
- ユーザー登録、ログイン、ログアウト機能
- 画像・テキスト投稿
- いいね機能
- フォロワー機能

## DB設計
## ユーザー登録機能
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

## 投稿機能
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

## 写真投稿機能
### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to  :message,  optional: true

## コメント機能
### commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foregin_key: true|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to :user
- belongs_to :message

## お気に入り機能
### likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foregin_key: true|
|message|references|null: false, foregin_key: true|

#### Association
- belongs_to :user
- belongs_to :message

## フォロワー機能
### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follower_id|references|null: false, foregin_key: true|
|followed_id|references|null: false, foregin_key: true|

#### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## タグ機能
### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|tag_name|string|null: false|

#### Association
- has_many :message_tags
- has_many :messages,  through: :message_tags

## タグ機能
### relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|message|references|null: false, foregin_key: true|
|tag|references|null: false, foregin_key: true|

#### Association
- belongs_to :message
- belongs_to :tag