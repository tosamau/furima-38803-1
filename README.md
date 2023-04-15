
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
| birth_year         | integer | null: false                |
| birth_month        | integer | null: false                |
| birth_day          | integer | null: false                |

- has_many :items
- has_many :purchases

## itemsテーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| categories    | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| ship_from     | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

- belongs_to :users
- has_one :purchases 

## purchasesテーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

- belongs_to :items
- has_one :shipping_addresses 

## shipping_addressesテーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| city_name     | string     | null: false,                   |
| house_number  | string     | null: false,                   |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

- belongs_to :purchases