class Prototype < ApplicationRecord

  # with_options presence: true do 
  #   validates :title
  #   validates :catch_copy
  #   validates :concept
  # end

  belongs_to :user # 相手のモデルのidが空ではないかというバリデーションがデフォルトでかかる。
end
