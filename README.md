# テーブル設計

## usersテーブル

| Column            | Type    | Option      |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| password_confirm  | string  | null: false |
| first_name        | string  | null: false |
| last_name         | string  | null: false |
| kana_first_name   | string  | null: false |
| kana_last_name    | string  | null: false |
| year              | integer | null: false |
| month             | integer | null: false |
| date              | integer | null: false |

 ### Association

- has_many :items
- has_many :records

## itemsテーブル

| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| image       |            |                   |
| name        | string     | null: false       |
| description | text       | null: false       |
| category    | string     | null: false       |
| status      | string     | null: false       |
| burden      | string     | null: false       |
| area        | string     | null: false       |
| days        | integer    | null: false       |
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

| Column       | Type       | Option            |
| ------------ | ---------- | ----------------- |
| postal_code  | integer    | null: false       |
| prefecture   | string     | null: false       |
| municipality | string     | null: false       |
| address      | integer    | null: false       |
| phone_number | integer    | null: false       |
| record       | references | foreign_key: true |

### Association

- belongs_to :record