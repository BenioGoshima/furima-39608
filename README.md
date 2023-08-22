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

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               | 
| first_name         | string | null: false               | 
| last_name          | string | null: false               | 
| first_name_kana    | string | null: false               | 
| last_name_kana     | string | null: false               | 
| birthdate          | date   | null: false               | 

### Association

## itemsテーブル

| Column      | Type       | Options                        | 
| ----------- | ---------- | ------------------------------ | 
| trade_name  | string     | null: false                    | 
| description | text       | null: false                    | 
| category    | string     | null: false                    | 
| condition   | string     | null: false                    | 
| postage     | string     | null: false                    | 
| ships_from  | string     | null: false                    | 
| date        | string     | null: false                    | 
| price       | integer    | null: false                    | 
| user        | references | null: false, foreign_key: true | 

### Association

## buysテーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user_id | references | null: false, foreign_key: true | 
| item_id | references | null: false, foreign_key: true | 

### Association

## deliveriesテーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| postal_code    | integer    | null: false                    | 
| prefectures    | string     | null: false                    | 
| municipalities | string     | null: false                    | 
| house_number   | integer    | null: false                    | 
| building_name  | string     |                                | 
| phone_number   | integer    | null: false                    | 
| buy_id         | references | null: false, foreign_key: true | 

### Association

## commentsテーブル

| Column   | Type       | Options                        | 
| -------- | ---------- | ------------------------------ | 
| contents | text       | null: false                    | 
| user_id  | references | null: false, foreign_key: true | 
| item_id  | references | null: false, foreign_key: true | 

### Association