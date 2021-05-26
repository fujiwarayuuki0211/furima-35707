# テーブル設計

## usersテーブル

| Column             | Type    | Option       |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| first_name         | string  | null: false  |
| last_name          | string  | null: false  |
| kana_first_name    | string  | null: false  |
| kana_last_name     | string  | null: false  |
| birth_date         | date    | null: false  |

 ### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| description | text       | null: false       |
| category_id | integer    | null: false       |
| status_id   | integer    | null: false       |
| burden_id   | integer    | null: false       |
| area_id     | integer    | null: false       |
| days_id     | integer    | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |

 ### Association

- belongs_to :user
- has_one :record

## recordsテーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| building      | string     |                   |
| address       | string     | null: false       |
| phone_number  | string     | null: false       |
| record        | references | foreign_key: true |

### Association

- belongs_to :record