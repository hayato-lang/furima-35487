# テーブル設計

## usersテーブル

| Column             | Types   | Options                    | 
| ------------------ | ------- | ---------------------------| 
| nickname           | string  |  null: false               | 
| email              | string  |  null: false, unique: true | 
| encrypted_password | string  |  null: false               | 
| first_name         | string  |  null: false               | 
| last_name          | string  |  null: false               | 
| first_name_kana    | string  |  null: false               | 
| last_name_kana     | string  |  null: false               | 
| birthday           | date    |  null: false               | 

### Association
- has_many :items
- has_many :orders
- has_many :comments

## itemsテーブル

| Column            | Types               | Options                        | 
| ----------------- | ------------------- | ------------------------------ | 
| name              | string              | null: false                    | 
| description       | text                | null: false                    | 
| category_id       | integer             | null: false                    | 
| status_id         | integer             | null: false                    | 
| fee_id            | integer             | null: false                    | 
| prefecture_id     | integer             | null: false                    | 
| shipping_day_id   | integer             | null: false                    | 
| price             | integer             | null: false                    | 
| user              | references          | null: false, foreign_key: true | 

### Association
- has_many :comments
- belongs_to :user
- has_one :order

## ordersテーブル

| Column          | Types      | Options                        | 
| --------------- | ---------- | ------------------------------ | 
| user            | references | null: false, foreign_key: true | 
| item            | references | null: false, foreign_key: true | 


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| postal_code     | string     | null: false                    | 
| prefecture_id   | integer    | null: false                    | 
| municipality    | string     | null: false                    | 
| address         | string     | null: false                    | 
| building_name   | string     |                                | 
| phone_number    | string     | null: false                    | 
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order

