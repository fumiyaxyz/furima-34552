# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| description     | text       | null: false |
| category_id     | integer    | null: false |
| status_id       | integer    | null: false |
| delivery_fee_id | integer    | null: false |
| prefecture_id   | integer    | null: false |
| ship_days_id    | integer    | null: false |
| price           | integer    | null: false |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :orders

## favorites テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


##  addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_number  | string     |             |
| phone_number     | string     | null: false |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order

