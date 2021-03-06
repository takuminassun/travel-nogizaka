# Pilgrimage

Sacred place app  

聖地投稿アプリです。

## Overview

Application for Nogizaka Otaku by Nogizaka Otaku of Nogizaka Otaku  

乃木オタの乃木オタによる乃木オタのためのアプリケーション

## Description

Post sacred places you know or find suggestions for determining your travel destination  

あなたの知っている聖地を投稿したり、旅行の目的地を決める際の候補を探せます


# DB

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
