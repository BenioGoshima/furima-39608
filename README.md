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

| Column              | Type   | Options                   | 
| ------------------- | ------ | ------------------------- | 
| nickname            | string | null: false               | 
| email               | string | null: false, unique: true | 
| encrypted_password  | string | null: false               | 
| first_name          | string | null: false               | 
| last_name           | string | null: false               | 
| first_name_kana     | string | null: false               | 
| last_name_kana      | string | null: false               | 
| birth_date          | date   | null: false               | 

### Association

## itemsテーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ | 
| trade_name    | string     | null: false                    | 
| description   | text       | null: false                    | 
| category_id   | integer    | null: false                    | 
| condition_id  | integer    | null: false                    | 
| postage_id    | integer    | null: false                    | 
| prefecture_id | integer    | null: false                    | 
| date_id       | integer    | null: false                    | 
| price         | integer    | null: false                    | 
| user          | references | null: false, foreign_key: true | 

### Association

## ordersテーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true | 
| item    | references | null: false, foreign_key: true | 

### Association

## addressesテーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ | 
| postal_code    | integer    | null: false                    | 
| prefecture_id  | integer    | null: false                    | 
| municipalities | string     | null: false                    | 
| house_number   | integer    | null: false                    | 
| building_name  | string     |                                | 
| phone_number   | string     | null: false                    | 
| order          | references | null: false, foreign_key: true | 

### Association