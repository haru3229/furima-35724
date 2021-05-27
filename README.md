# テーブル設計


## Users テーブル 

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |   
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| family_name          | string  | null: false               |
| first_name           | string  | null: false               |
| family_name_kana     | string  | null: false               |
| first_name_kana      | string  | null: false               |
| birth_day            | date    | null: false               |

### Association

has_many :items
has_many :orders



## Items テーブル 

| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |   
| name            | string       | null: false                    |
| description     | text         | null: false                    |
| category        | string       | null: false                    |
| status          | string       | null: false                    |
| cost            | string       | null: false                    |
| brand           | string       | null: false                    |
| day             | string       | null: false                    |
| price           | string       | null: false                    |
| user            | references   | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :address



##  Ordersテーブル 

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |   
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :address



## Addresses テーブル 

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |   
| postal_code          | string      | null: false                    |
| brand                | string      | null: false                    |
| city                 | string      | null: false                    |
| address              | string      | null: false                    |
| building             | string      |                                |
| phone_number         | string      | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| item                 | references  | null: false, foreign_key: true |

belongs_to :order
belongs_to :item