# README

# README
# テーブル設計

## users
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nick_name          | string     | null: false
| email              | string     | null: false, unique: true      |
| password           | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| name               | string     | null: false, full name         |
| katagana_name      | string     | null: false                    |
| date_of_birth      | text       | null: false                    |

### Association
- has_many :orders
- has_many :items

## items
| Column               | Type         | Options                        |
| ---------------------| -------------| ------------------------------ |
| product_name         | string       | null: false                    |
| explanation          | text         | null: false                    |
| category             | integer      | null: false                    |
| product_condition    | integer      | null: false                    |
| shipping_cost        | integer      | null: false                    | 
| shipping_source_area | integer      | null: false                    |
| shipping_time        | integer      | null: false                    |
| cost                 | integer      | null: false                    |
| user                 | references   | null: false foreign_key: true  |
| oder                 | references   | null: false foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :order

oders
## 
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| items              | references | null: false, foreign_key: true |

### Association
- has_many :items
- has_many :address
- belongs_to :user

### Address
| Column               | Type         | Options                        |
| ---------------------| -------------| ------------------------------ |
| postal_code          | integer      | null: false                    |
| prefecture           | integ        | null: false                    |
| city                 | string       | null: false                    |
| buiding_name         | string       |                                |
| phone_number         | interger     | null: false                    | 

### Association
- belongs_to :order