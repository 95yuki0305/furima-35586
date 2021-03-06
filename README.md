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
- has_many :product_users
_ has_many :products

## products テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| description         | text        | null: false                    |
| category_id         | integer     | null: false                    |
| status_id           | integer     | null: false                    |
| shipping_charges_id | integer     | null: false                    |
| prefecture_id       | integer     | null: false                    |
| days_to_ship_id     | integer     | null: false                    |
| selling_price       | integer     | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :product_user

## product_user テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :address

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| product_user     | references | null: false, foreign_key: true |

### Association
belongs_to :product_user