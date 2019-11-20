# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :comments, through: :users_comments
- has_many :members, through: :users_members

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|place|string|null: false|
|text|text|null: false|
|image_url|string|null: false|
### Association
- has_many :users, through: :users_comments
- has_many :members, through: :comments_members

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :users, through: :users_members
- has_many :comments, through: :comments_members

## users_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|comments_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :comment

## users_membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|member_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :member

## comments_membersテーブル
|Column|Type|Options|
|------|----|-------|
|comment_id|integer|null: false, foreign_key: true|
|member_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :comment
- belongs_to :member
