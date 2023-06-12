# テーブル設計

## users テーブル

| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| nickname           | string     | null: false      |
| email              | string     | null: false      |
| encrypted_password | string     | null: false      |
| family_name        | string     | null: false      |
| last_name          | string     | null: false      |
| family_name_kana   | string     | null: false      |
| last_name_kana     | string     | null: false      |
| birth_day          | integer    | null: false      |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| title            | string      | null: false                    |
| text             | text        | null: false                    |
| image            | string      | null: false                    |
| price            | integer     | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| shipping_days_id | integer     | null: false                    |
| shipping_cost_id | integer     | null: false                    |
| shipping_area_id | integer     | null: false                    |
| user_id          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user_id         | references  | null: false, foreign_key: true |
| item_id         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type           | Options                        |
| --------------- | -------------- | ------------------------------ |
| post_code       | string         | null: false                    |
| prefectures_id  | integer        | null: false                    |
| municipalities  | string         | null: false                    |
| address         | string         | null: false                    |
| building_name   | string         |                                |
| phone_number    | string         | null: false                    |
| orders          | references     | null: false, foreign_key: true |

### Association

- belongs_to :order