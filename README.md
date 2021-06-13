# テーブル設計

## usersテーブル

| Column             | Types   | Options      | 
| ------------------ | ------- | ------------ | 
| nickname           | string  |  null: false | 
| email              | string  |  null: false | 
| encrypted_password | string  |  null: false | 
| first_name         | string  |  null: false | 
| last_name          | string  |  null: false | 
| first_name_kana    | string  |  null: false | 
| last_name_kana     | string  |  null: false | 
| birthday           | integer |  null: false | 

### Association
- has_many :items
- has_many :orders
- has_many :comments

## itemsテーブル

| Column      | Types               | Options                        | 
| ----------- | ------------------- | ------------------------------ | 
| name        | string              | null: false                    | 
| description | text                | null: false                    | 
| category    | string              | null: false                    | 
| status      | string              | null: false                    | 
| fee         | string              | null: false                    | 
| area        | string              | null: false                    | 
| days        | string              | null: false                    | 
| price       | integer             | null: false                    | 
| image       | ActiveStorageで実装  |                                | 
| user        | references          | null: false, foreign_key: true | 

### Association
- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル

| Column          | Types      | Options                        | 
| --------------- | ---------- | ------------------------------ | 
| card_number     | integer    | null: false                    | 
| expiration_date | integer    | null: false                    | 
| security_code   | integer    | null: false                    | 
| postal_code     | integer    | null: false                    | 
| prefectures     | string     | null: false                    | 
| municipality    | string     | null: false                    | 
| address         | string     | null: false                    | 
| building_name   | string     |                                | 
| phone_number    | integer    | null: false                    | 
| user            | references | null: false, foreign_key: true | 
| item            | references | null: false, foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル

| Column | Types      | Options                        | 
| ------ | ---------- | ------------------------------ | 
| text   | text       |                                | 
| user   | references | null: false, foreign_key: true | 
| item   | references | null: false, foreign_key: true | 

### Association
- belongs_to user
- belongs_to item