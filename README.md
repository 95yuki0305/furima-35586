# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family name      | string  | null: false |
| first name       | string  | null: false |
| family name ruby | string  | null: false |
| first name ruby  | string  | null: false |
| birthday         | integer | null: false |

### Association
- has_many :products
- has_one :buyer

## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| shipping charges | string     | null: false                    |
| shipping area    | string     | null: false                    |
| days to ship     | string     | null: false                    |
| selling price    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to :user

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building name | string     |                                |
| phone number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user