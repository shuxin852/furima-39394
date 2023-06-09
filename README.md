# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| family_name        | string     | null: false               |
| last_name          | string     | null: false               |
| family_name_kana   | string     | null: false               |
| last_name_kana     | string     | null: false               |
| birth_day          | date       | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| title            | string      | null: false                    |
| describe         | text        | null: false                    |
| price            | integer     | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| shipping_day_id  | integer     | null: false                    |
| shipping_cost_id | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type           | Options                        |
| --------------- | -------------- | ------------------------------ |
| post_code       | string         | null: false                    |
| prefecture_id   | integer        | null: false                    |
| municipalities  | string         | null: false                    |
| address         | string         | null: false                    |
| building_name   | string         |                                |
| phone_number    | string         | null: false                    |
| orders          | references     | null: false, foreign_key: true |

### Association

- belongs_to :order