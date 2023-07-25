# README

# README
# テーブル設計

## users
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nick_name          | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| katagana_first_name| string     | null: false                    |
| katagana_last_name | string     | null: false                    |
| date_of_birth      | date       | null: false                    |

### Association
- has_many :orders
- has_many :items

## items
| Column                  | Type         | Options                        |
| ------------------------| -------------| ------------------------------ |
| product_name            | string       | null: false                    |
| explanation             | text         | null: false                    |
| category_id             | integer      | null: false                    |
| product_condition_id    | integer      | null: false                    |
| shipping_cost_id        | integer      | null: false                    | 
| shipping_source_area_id | integer      | null: false                    |
| shipping_time_id        | integer      | null: false                    |
| cost                    | integer      | null: false                    |
| user                    | references   | null: false foreign_key: true  |


### Association
- belongs_to :user
- has_many :order

oders
## 
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_many :address
- belongs_to :user

### Addresss
| Column               | Type         | Options                        |
| ---------------------| -------------| ------------------------------ |
| postal_code          | string       | null: false                    |
| prefecture_id        | integer      | null: false                    |
| city                 | string       | null: false                    |
| house_number         | interger     | null: flase                    |
| buiding_name         | string       |                                |
| phone_number         | string       | null: false                    | 
| order                | references   | null: false, foreign_key: true |                   |
### Association
- belongs_to :order