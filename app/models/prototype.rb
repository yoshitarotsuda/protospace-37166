class Prototype < ApplicationRecord

  # with_options presence: true do #with_options オプションの記述をまとめるのに使える、if使用時の記述パターンに注意
  #   validates :
  #   validates :
  #   validates :
  # end

  belongs_to :user # 相手のモデルのidが空ではないかというバリデーションがデフォルトでかかる。
end
