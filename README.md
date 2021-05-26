# テーブル設計


## users テーブル 

| Column               | Type    | Option      |
| -------------------- | ------- | ----------- |   
| nickname             | string  | null: false |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| family_name          | string  | null: false |
| first_name           | string  | null: false |
| birth_day            | string  | null: false |


## items テーブル 

| Column           | Type        | Option                         |
| --------------- | ------------ | ------------------------------ |   
| image           |              |                                |
| item_name       | string       | null: false                    |
| description     | text         | null: false                    |
| category        | string       | null: false                    |
| sutatus         | string       | null: false                    |
| cost            | string       | null: false                    |
| brand           | string       | null: false                    |
| day             | string       | null: false                    |
| price           | string       | null: false                    |
| user_id         | references   | null: false, foreign_key: true |


##  ordersテーブル 

| Column     | Type        | Option                         |
| ---------- | ----------- | ------------------------------ |   
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |


## addresses テーブル 

| Column               | Type        | Option                         |
| -------------------- | ----------- | ------------------------------ |   
| postal_code          | string      | null: false                    |
| prefecture           | string      | null: false                    |
| city                 | string      | null: false                    |
| address              | string      | null: false                    |
| phone_number         | string      | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| first_name           | references  | null: false, foreign_key: true |
| family_name          | references  | null: false, foreign_key: true |