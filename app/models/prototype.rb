class Prototype < ApplicationRecord

  with_options presence: true do 
    validates :title
    validates :catch_copy
    validates :concept
    validates :image

  end

  belongs_to :user # 相手のモデルのidが空ではないかというバリデーションがデフォルトでかかる。
  has_one_attached :image # レコードとファイルの1対1の関係の紐付け
  has_many :comments, dependent: :destroy # dependent(付属、依存、眷属)オプションに:destroy指定

end