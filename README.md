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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| gender          | string | null; false |
| birth_date      | string | null: false |
| prefecture      | string | null: false |

### Association

- has_many :user_planners
- has_many :user_rooms
- has_many :messages


## planners テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| gender          | string | null; false |
| birth_date      | string | null: false |
| prefecture      | string | null: false |

### Association

- has_many :user_planners
- has_many :user_rooms
- has_many :messages


## user_planners テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user_id    | reference | foreign_key: true |
| planner_id | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :planner


## user_room テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| user_id    | reference | foreign_key: true |
| planner_id | reference | foreign_key: true |
| room_id    | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :planner
- belongs_to :room


## rooms テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |

### Association

- has_many :user_rooms
- has_many :messages


## messages テーブル

| Column     | Type      | Options           |
| ---------- | --------- | ----------------- |
| comment    | text      | null: false       |
| user_id    | reference | foreign_key: true |
| planner_id | reference | foreign_key: true |
| room_id    | reference | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :planner
- belongs_to :room