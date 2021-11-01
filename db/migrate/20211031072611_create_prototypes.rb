class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title,      null: false
      t.text       :catch_copy, null: false
      t.text       :concept,    null: false
      t.references :user,       null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end

# 外部キーのカラムの追加reference型を使うメリット
# userではなくuser_idというカラム名を作成してくれる
# インデックスを自動で貼ってくれる
# 注)外部キー制約はreferenceだけでは付かないことに気を付ける