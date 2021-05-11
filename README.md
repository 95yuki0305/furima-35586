# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_ruby   | string  | null: false               |
| first_name_ruby    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :products
- has_many :buyers

## products テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| description         | text        | null: false                    |
| category_id         | integer     | null: false                    |
| status_id           | integer     | null: false                    |
| shipping_charges_id | integer     | null: false                    |
| shipping_area_id    | integer     | null: false                    |
| days_to_ship_id     | integer     | null: false                    |
| selling_price       | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :product_users

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user