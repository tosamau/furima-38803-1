
## usersテーブル 

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false                |
| nickname           | string  | null: false                |
| family_name        | string  | null: false                |
| last_name          | string  | null: false                |
| family_name_kana   | string  | null: false                |
| last_name_kana     | string  | null: false                |
| birth              | date    | null: false                |

- has_many :items
- has_many :orders

## itemsテーブル 

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| ship_from_id    | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :order 

## odersテーブル 

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :address 

## addressesテーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| ship_from_id  | integer    | null: false                    |
| city_name     | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

- belongs_to :order