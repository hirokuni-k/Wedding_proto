# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...


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

- has_many palanners through: :selects
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
| room    | reference | foreign_key: true |

### Association

- belongs_to :room