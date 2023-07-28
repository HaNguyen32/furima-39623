# README

# README
# テーブル設計

## users
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nick_name          | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| date_birth         | date       | null: false                    |

### Association
- has_many :orders
- has_many :items

## items
| Column                        | Type         | Options                        |
| ------------------------------| -------------| ------------------------------ |
| name                          | string       | null: false                    |
| info                          | text         | null: false                    |
| category_id                   | integer      | null: false                    |
| sales_status_id               | integer      | null: false                    |
| shipping_fee_status_id        | integer      | null: false                    | 
| prefecture_id                 | integer      | null: false                    |
| scheduled_delivery_id         | integer      | null: false                    |
| price                         | integer      | null: false                    |
| user                          | references   | null: false foreign_key: true  |


### Association
- belongs_to :user
- has_one :order

## oders 
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- has_one :address
- belongs_to :item
- belongs_to :user

### Addresss
| Column               | Type         | Options                        |
| ---------------------| -------------| ------------------------------ |
| postal_code          | string       | null: false                    |
| prefecture_id        | integer      | null: false                    |
| city                 | string       | null: false                    |
| house_number         | string       | null: flase                    |
| buiding_name         | string       |                                |
| phone_number         | string       | null: false                    | 
| order                | references   | null: false, foreign_key: true |                   |
### Association
- belongs_to :order