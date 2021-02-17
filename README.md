# README

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name_kanji | string | null: false |
| name_kana  | string | null: false |
| birthday   | date   | null: false |


### Association

- has_many :items
- has_many :recordings

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| name         | string     | null: false |
| description  | text       | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| delivery_fee | string     | null: false |
| prefecture   | string     | null: false |
| ship_days    | string     | null: false |
| price        | integer    | null: false |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_one :recording

## recordings テーブル

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
| prefecture       | string     | null: false |
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_number  | string     |             |
| phone_number     | string     | null: false |
| item             | references | null: false, foreign_key: true |


### Association

- belongs_to :recording

