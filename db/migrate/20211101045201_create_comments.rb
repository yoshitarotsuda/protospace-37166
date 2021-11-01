class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :content,   null: false
      t.references :user,      null: false, foreign_key: true # 外部キー設定
      t.references :prototype, null: false, foreign_key: true # 外部キー設定
      t.timestamps
    end
  end
end
