# README

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| gender_id       | integer | null; false |
| birth_date      | date    | null: false |
| prefecture_id   | integer | null: false |

### Association

- has_many :selects
- has_many :users, through: :selects
- has_many :rooms

<br>

## planners テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| encrypted_password | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| gender_id       | integer | null; false |
| birth_date      | date    | null: false |
| prefecture_id   | integer | null: false |

### Association

- has_many :selects
- has_many :planners, through: :selects
- has_many :rooms

<br>

## selects テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user    | references | foreign_key: true |
| planner | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :planner

<br>

## rooms テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user    | references | foreign_key: true |
| planner | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :planner
- has_many   :messages

<br>

## messages テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| message    | text      | null: false       |
| whom_id    | integer   | null: false       |
| room    | references | foreign_key: true |

### Association

- belongs_to :room