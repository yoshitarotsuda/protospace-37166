# テーブル設計

## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| profile            | text   | null: false              |
| occupation         | text   | null: false              |
| position           | text   | null: false              |

### Association

- has_many : prototypes
- has_many : comments

## prototypesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| catch_copy         | text       | null: false                   |
| concept            | text       | null: false                   |
| user               | references | null: false, foreign_key:true |

### Association

- has_many : comments
- belongs_to :users

## commentsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| content            | text       | null: false                   |
| prototype          | references | null: false, foreign_key:true |
| user               | references | null: false, foreign_key:true |

### Association

- belongs_to :users
- belongs_to :prototypes

### 日本語メモ

- unique:true 一意性制約/ユニーク制約/UNIQUE制約/一意制約/unique constraint

  データベースでテーブルにデータを追加、更新する際の制約の一つで、その列の中でデータが一意(他と重複しない)でなければならないという制約。

  例)登録Eメールアドレス、ユーザー名(重複禁止の場合)

- foreign_key:true 外部キー制約

  外部キーとは、関連する他のテーブルのレコードの主キーを値とする項目。

  例)ここでのcommentに対する、『user』『prototype』

- 主キー制約

  主キーのデータが空になることがなく、かつ重複していないことを保証する制約。
  
  例)Railsでテーブル作成時において自動生成される『id』カラム